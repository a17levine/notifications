require 'rails_helper'
RSpec.describe ProcessWebHookNotificationWorker, type: :worker do
  before :each do
    @params = { :message => {
        :account_name => "alevee",
        :text => "Hello world!",
        :timestamp => 1.day.ago.iso8601
      }
    }
    ProcessWebHookNotificationWorker.new.perform(@params) 
  end
  
  it "creates the words hello and world, downcased since hello had a capital H" do
    expect(Word.where(text: ['hello', 'world']).count).to eq(2)
  end

  it "iterates the counters on the words hello and world" do
    word_table_ids = Word.where(text: ['hello', 'world']).pluck(:id)
    expect(AccountWord.where(word_id: word_table_ids).pluck(:total_count)).to eq([1,1])
  end

end

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
    account = Account.find_by(name: 'alevee')
    expect(AccountWord.where(word_id: word_table_ids, account_id: account.id).pluck(:total_count)).to eq([1,1])
  end


  it "saves the user" do
    expect(Account.find_by(name: 'alevee')).to_not be_nil
  end

  it "saves the WebHookNotification" do
    account = Account.find_by(name: 'alevee')
    expect(WebHookNotification.where(account_id: account.id).last.message_text).to eq("Hello world!")
    expect(WebHookNotification.where(account_id: account.id).last.message_occurred_at < 1.day.ago).to eq(true)
    expect(WebHookNotification.where(account_id: account.id).last.raw_body_of_webhook_request).to_not be_nil
  end
end

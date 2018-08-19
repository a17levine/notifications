require 'rails_helper'

RSpec.describe WebHookNotificationsController, type: :controller do

  describe "POST #create" do
    before :each do
      post :create, :params => { :message => {
          :account_name => "alevee",
          :text => "Hello world!",
          :timestamp => 1.day.ago.iso8601
        }
      }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "creates the words hello and world, downcased since hello had a capital H" do
      expect(Word.where(text: ['hello', 'world']).count).to eq(2)
    end

    it "iterates the counters on the words hello and world" do
      word_table_ids = Word.where(text: ['hello', 'world']).pluck(:id)
      expect(AccountWord.where(word_id: word_table_ids).pluck(:total_count)).to eq([1,1])
    end
  end

end

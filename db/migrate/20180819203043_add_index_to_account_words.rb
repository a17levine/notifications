class AddIndexToAccountWords < ActiveRecord::Migration[5.2]
  def change
    add_index :account_words, [:account_id, :word_id]
  end
end

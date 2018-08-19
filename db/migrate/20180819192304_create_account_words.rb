class CreateAccountWords < ActiveRecord::Migration[5.2]
  def change
    create_table :account_words do |t|
      t.references :word, foreign_key: true
      t.references :account, foreign_key: true
      t.integer :total_count, default: 0

      t.timestamps
    end
  end
end

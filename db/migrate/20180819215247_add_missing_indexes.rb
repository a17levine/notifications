class AddMissingIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :accounts, :name, unique: true
  end
end

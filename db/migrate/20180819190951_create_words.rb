class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :text, index: {unique: true}

      t.timestamps
    end
  end
end

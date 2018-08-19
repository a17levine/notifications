class CreateWebHookNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :web_hook_notifications do |t|
      t.references :account, foreign_key: true
      t.string :message_text
      t.datetime :message_occurred_at
      t.string :raw_body_of_webhook_request

      t.timestamps
    end
  end
end

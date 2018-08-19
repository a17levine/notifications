# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_19_203043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_words", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "account_id"
    t.integer "total_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "word_id"], name: "index_account_words_on_account_id_and_word_id"
    t.index ["account_id"], name: "index_account_words_on_account_id"
    t.index ["word_id"], name: "index_account_words_on_word_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "web_hook_notifications", force: :cascade do |t|
    t.bigint "account_id"
    t.string "message_text"
    t.datetime "message_occurred_at"
    t.string "raw_body_of_webhook_request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_web_hook_notifications_on_account_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["text"], name: "index_words_on_text", unique: true
  end

  add_foreign_key "account_words", "accounts"
  add_foreign_key "account_words", "words"
  add_foreign_key "web_hook_notifications", "accounts"
end

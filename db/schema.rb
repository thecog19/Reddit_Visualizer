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

ActiveRecord::Schema.define(version: 20170210163350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "subreddit_connections", force: :cascade do |t|
    t.integer  "subreddit_from_id"
    t.integer  "subreddit_to_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["subreddit_from_id", "subreddit_to_id"], name: "from_to", unique: true, using: :btree
    t.index ["subreddit_to_id", "subreddit_from_id"], name: "to_from", unique: true, using: :btree
  end

  create_table "subreddits", force: :cascade do |t|
    t.bigint   "subscriber_count"
    t.string   "url"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end

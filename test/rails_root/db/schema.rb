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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110629003430) do

  create_table "historian_categories", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "metric_keys"
    t.text     "metric_titles"
    t.text     "annotation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historian_metrics", :force => true do |t|
    t.integer  "historian_record_id"
    t.string   "name"
    t.string   "title"
    t.string   "format"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historian_metrics", ["historian_record_id"], :name => "index_historian_metrics_on_historian_record_id"

  create_table "historian_records", :force => true do |t|
    t.integer  "historian_category_id"
    t.text     "annotation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "historian_records", ["created_at"], :name => "index_historian_records_on_created_at"
  add_index "historian_records", ["historian_category_id"], :name => "index_historian_records_on_historian_category_id"

end

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

ActiveRecord::Schema.define(:version => 20101221031913) do

  create_table "alarms", :force => true do |t|
    t.integer  "calendar_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "dtstart"
    t.string   "dtend"
    t.string   "ical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", :force => true do |t|
    t.string   "ical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dummy_resources", :force => true do |t|
    t.string   "suck"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "calendar_id"
    t.string   "dtstart"
    t.string   "dtend"
    t.string   "ical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "free_busies", :force => true do |t|
    t.integer  "calendar_id"
    t.string   "dtstart"
    t.string   "dtend"
    t.string   "ical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inspectables", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", :force => true do |t|
    t.integer  "calendar_id"
    t.string   "dtstart"
    t.string   "dtend"
    t.string   "ical"
    t.string   "categories"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patterns", :force => true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.string  "type"
    t.string  "rule"
  end

  create_table "todos", :force => true do |t|
    t.integer  "calendar_id"
    t.string   "dtstart"
    t.string   "dtend"
    t.string   "ical"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20171214233715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_lead_interviews", force: :cascade do |t|
    t.string "title"
    t.integer "trainer_id"
    t.string "date"
    t.string "location"
    t.integer "company_lead_id"
    t.text "notes"
    t.string "hire", default: "N/A"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_lead_rsvp_tickets", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.string "description"
    t.string "location"
    t.integer "company_lead_id"
    t.integer "company_lead_rsvp_id"
    t.integer "confirmation"
    t.boolean "scanned", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "otp_secret_key"
  end

  create_table "company_lead_rsvps", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.string "description"
    t.string "location"
    t.integer "company_lead_id"
    t.boolean "checked_in", default: false
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_leads", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "phone_number"
    t.boolean "licensed", default: false
    t.boolean "trainer_purchased", default: false
    t.string "hire", default: "N/A"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainer_lead_interviews", force: :cascade do |t|
    t.string "title"
    t.integer "trainer_id"
    t.string "date"
    t.string "location"
    t.integer "trainer_lead_id"
    t.text "notes"
    t.string "hire", default: "N/A"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainer_lead_rsvp_tickets", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.string "description"
    t.string "location"
    t.integer "trainer_lead_id"
    t.integer "trainer_lead_rsvp_id"
    t.integer "confirmation"
    t.integer "barcode"
    t.boolean "scanned", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "otp_secret_key"
  end

  create_table "trainer_lead_rsvps", force: :cascade do |t|
    t.string "title"
    t.string "date"
    t.string "description"
    t.string "location"
    t.integer "trainer_lead_id"
    t.integer "event_id"
    t.boolean "checked_in", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainer_leads", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "phone_number"
    t.boolean "licensed", default: false
    t.boolean "company_purchased", default: false
    t.string "hire", default: "N/A"
    t.integer "trainer_id"
    t.integer "interview_trainer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "phone_number"
    t.string "url"
    t.boolean "occupied", default: false
    t.boolean "hold", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
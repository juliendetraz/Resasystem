# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100326135518) do

  create_table "ads", :force => true do |t|
    t.string   "reference"
    t.string   "title"
    t.text     "description"
    t.boolean  "is_validated"
    t.integer  "housing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ad_id"
  end

  create_table "housings", :force => true do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.string   "phone_contact"
    t.string   "email"
    t.string   "website"
    t.string   "name"
    t.string   "type"
    t.string   "url_alias"
    t.string   "distance_commerce"
    t.string   "distance_train"
    t.string   "distance_transport"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "housings_id"
    t.boolean  "has_elevator"
    t.integer  "floor"
    t.integer  "capacity"
    t.boolean  "is_visible"
  end

  create_table "offers", :force => true do |t|
    t.integer  "offers_id"
    t.integer  "housing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price_id"
    t.integer  "calendar_id"
  end

end

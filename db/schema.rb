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

ActiveRecord::Schema.define(:version => 20100626074223) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "complement"
    t.string   "zip"
    t.string   "state_province_country"
    t.string   "other_address_details"
    t.string   "city"
    t.string   "country"
    t.decimal  "gmap_latitude",          :precision => 10, :scale => 7
    t.decimal  "gmap_longitude",         :precision => 10, :scale => 7
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "bathrooms", :force => true do |t|
    t.integer  "room_id"
    t.boolean  "has_bath"
    t.boolean  "has_toilets"
    t.boolean  "has_shower"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bedrooms", :force => true do |t|
    t.integer  "room_id"
    t.integer  "beds_simple_quantity"
    t.integer  "beds_double_quantity"
    t.integer  "beds_bunk_quantity"
    t.integer  "beds_cott_quantity"
    t.boolean  "has_shared_bathroom"
    t.boolean  "has_shared_toilets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "calendars", :force => true do |t|
    t.string   "offer_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "availability_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dinningrooms", :force => true do |t|
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sofa_bed_option"
  end

  create_table "housing_pois", :force => true do |t|
    t.integer  "housing_poi_id"
    t.integer  "housing_id"
    t.string   "name"
    t.decimal  "distance",       :precision => 5, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "housing_user", :force => true do |t|
    t.integer  "user_id"
    t.integer  "housing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "housings", :force => true do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.string   "phone_contact"
    t.string   "email"
    t.string   "website"
    t.string   "name"
    t.string   "housing_type"
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

  create_table "housings_services", :id => false, :force => true do |t|
    t.integer "housing_id"
    t.integer "service_id"
  end

  create_table "kitchens", :force => true do |t|
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kitchen_type"
  end

  create_table "livingrooms", :force => true do |t|
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_usergroups", :force => true do |t|
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_usergroup_id"
    t.integer  "parent_message"
    t.string   "subject"
    t.text     "body"
    t.boolean  "is_sent"
    t.boolean  "is_new"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "language"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offer_prices", :force => true do |t|
    t.integer  "offer_id"
    t.decimal  "price",      :precision => 5, :scale => 2
    t.string   "season"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offer_rooms", :force => true do |t|
    t.integer  "room_id"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.integer  "offers_id"
    t.integer  "housing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "url"
    t.string   "path"
    t.string   "order"
    t.boolean  "is_default"
    t.boolean  "is_visible"
    t.boolean  "is_validated"
    t.datetime "date_validated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "calendar_id"
    t.string   "reservation_status"
    t.datetime "reservation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_pictures", :force => true do |t|
    t.integer  "room_id"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "room_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "housing_id"
  end

  create_table "services", :force => true do |t|
    t.string   "name"
    t.string   "service_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_contact"
    t.string   "phone_fax"
    t.string   "phone_mobile"
    t.string   "phone_pro"
    t.string   "phone_home"
    t.string   "role"
    t.boolean  "is_active"
    t.string   "language"
    t.boolean  "has_subscribed"
    t.string   "firstday_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

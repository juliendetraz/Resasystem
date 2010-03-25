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

ActiveRecord::Schema.define(:version => 20100325164621) do

  create_table "annonces", :force => true do |t|
    t.string   "reference"
    t.string   "title"
    t.text     "description"
    t.boolean  "is_validated"
    t.integer  "hebergement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hebergements", :force => true do |t|
    t.integer  "hebergement_id"
    t.integer  "offre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offres", :force => true do |t|
    t.integer  "hebergement_id"
    t.integer  "address_id"
    t.integer  "user_id"
    t.string   "phone_contact"
    t.string   "email"
    t.string   "website"
    t.string   "name"
    t.string   "is_visible"
    t.string   "type"
    t.string   "url_alias"
    t.string   "distance_commerce"
    t.string   "distance_train"
    t.string   "distance_transport"
    t.string   "gmap_latitude"
    t.string   "gmap_longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

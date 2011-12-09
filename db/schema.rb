# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20111209051433) do

  create_table "plants", :force => true do |t|
    t.string   "common_name"
    t.string   "genus"
    t.string   "species"
    t.string   "zone"
    t.string   "light"
    t.string   "moisture"
    t.string   "soil_texture"
    t.string   "soil_ph"
    t.string   "form"
    t.string   "height"
    t.string   "width"
    t.string   "root_span"
    t.string   "lifespan"
    t.string   "growth_rate"
    t.string   "native"
    t.string   "edible"
    t.string   "medicinal"
    t.string   "nitrogen_fixer"
    t.string   "ground_cover"
    t.string   "dynamic_accumulator"
    t.string   "nectary"
    t.string   "cover_crop"
    t.string   "seed_stock_sources"
    t.string   "local_examples"
    t.string   "sources"
    t.text     "notes"
    t.string   "insects"
    t.string   "animals"
    t.string   "flavor_profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160504170357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "klass_spells", force: :cascade do |t|
    t.integer  "spell_id"
    t.integer  "klass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "klass_spells", ["klass_id"], name: "index_klass_spells_on_klass_id", using: :btree
  add_index "klass_spells", ["spell_id"], name: "index_klass_spells_on_spell_id", using: :btree

  create_table "klasses", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "klasses", ["name"], name: "index_klasses_on_name", unique: true, using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "specializations", force: :cascade do |t|
    t.string   "name"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spells", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.boolean  "ritual"
    t.string   "school"
    t.text     "components"
    t.string   "source"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "casting_time"
    t.string   "range"
    t.string   "duration"
  end

end

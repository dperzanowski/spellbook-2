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

ActiveRecord::Schema.define(version: 20161020192710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_spells", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "spell_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["character_id"], name: "index_character_spells_on_character_id", using: :btree
    t.index ["spell_id"], name: "index_character_spells_on_spell_id", using: :btree
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "klass_id"
    t.integer  "user_id"
  end

  create_table "klass_spells", force: :cascade do |t|
    t.integer  "spell_id"
    t.integer  "klass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["klass_id"], name: "index_klass_spells_on_klass_id", using: :btree
    t.index ["spell_id"], name: "index_klass_spells_on_spell_id", using: :btree
  end

  create_table "klasses", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_klasses_on_name", unique: true, using: :btree
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.string   "searchable_type"
    t.integer  "searchable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree
  end

  create_table "specialization_spells", force: :cascade do |t|
    t.integer  "specialization_id"
    t.integer  "spell_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["specialization_id"], name: "index_specialization_spells_on_specialization_id", using: :btree
    t.index ["spell_id"], name: "index_specialization_spells_on_spell_id", using: :btree
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spells", force: :cascade do |t|
    t.string   "name",         null: false
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

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end

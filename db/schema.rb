# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_11_200612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_v1_appointments", force: :cascade do |t|
    t.date "date", null: false
    t.time "time", null: false
    t.string "communication_medium", null: false
    t.integer "appointment_duration", null: false
    t.integer "student_id", null: false
    t.integer "tutor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating"
    t.text "comments"
  end

  create_table "api_v1_subjects", force: :cascade do |t|
    t.string "categories"
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "api_v1_tutor_subjects", force: :cascade do |t|
    t.integer "tutor_id", null: false
    t.bigint "api_v1_subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["api_v1_subject_id"], name: "index_api_v1_tutor_subjects_on_api_v1_subject_id"
  end

  create_table "api_v1_users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.integer "phone"
    t.string "password_digest"
    t.boolean "tutor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "api_v1_appointments", "api_v1_users", column: "student_id"
  add_foreign_key "api_v1_appointments", "api_v1_users", column: "tutor_id"
  add_foreign_key "api_v1_tutor_subjects", "api_v1_subjects"
  add_foreign_key "api_v1_tutor_subjects", "api_v1_users", column: "tutor_id"
end

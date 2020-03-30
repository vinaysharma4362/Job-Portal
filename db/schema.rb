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

ActiveRecord::Schema.define(version: 2020_03_27_113043) do

  create_table "apply_jobs", force: :cascade do |t|
    t.date "entry_date"
    t.integer "status"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_apply_jobs_on_post_id"
    t.index ["user_id"], name: "index_apply_jobs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.text "about"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "pincode"
    t.integer "contact_no"
    t.string "website"
    t.integer "status", default: 0
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "job_posts", force: :cascade do |t|
    t.string "job_title"
    t.string "description"
    t.string "job_type"
    t.string "location"
    t.string "required_skill"
    t.string "extra_skill"
    t.integer "salary_min"
    t.integer "salary_max"
    t.date "last_apply_date"
    t.string "language"
    t.string "job_field"
    t.integer "vacancy"
    t.string "status"
    t.integer "company_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_job_posts_on_company_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "resume_file"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "mobile"
    t.boolean "gender"
    t.integer "active"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "apply_jobs", "job_posts", column: "post_id"
  add_foreign_key "apply_jobs", "users"
  add_foreign_key "comments", "job_posts", column: "post_id"
  add_foreign_key "comments", "users"
  add_foreign_key "job_posts", "companies"
  add_foreign_key "resumes", "users"
end

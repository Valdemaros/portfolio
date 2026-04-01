# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_31_082239) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
  end

  create_table "project_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.bigint "project_id", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_project_categories_on_category_id"
    t.index ["project_id"], name: "index_project_categories_on_project_id"
  end

  create_table "project_features", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "feature_id", null: false
    t.bigint "project_id", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_project_features_on_feature_id"
    t.index ["project_id"], name: "index_project_features_on_project_id"
  end

  create_table "project_technologies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "project_id", null: false
    t.bigint "technology_id", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_technologies_on_project_id"
    t.index ["technology_id"], name: "index_project_technologies_on_technology_id"
  end

  create_table "project_themes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "project_id", null: false
    t.bigint "theme_id", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "theme_id"], name: "index_project_themes_on_project_id_and_theme_id", unique: true
    t.index ["project_id"], name: "index_project_themes_on_project_id"
    t.index ["theme_id"], name: "index_project_themes_on_theme_id"
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.boolean "featured"
    t.string "github_url"
    t.string "image_url"
    t.string "position"
    t.string "project_url"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "icon_url"
    t.integer "position"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "project_categories", "categories"
  add_foreign_key "project_categories", "projects"
  add_foreign_key "project_features", "features"
  add_foreign_key "project_features", "projects"
  add_foreign_key "project_technologies", "projects"
  add_foreign_key "project_technologies", "technologies"
  add_foreign_key "project_themes", "projects"
  add_foreign_key "project_themes", "themes"
end

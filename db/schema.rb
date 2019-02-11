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

ActiveRecord::Schema.define(version: 2019_02_09_175605) do

  create_table "camera_brands", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.boolean "is_ptz_available"
    t.boolean "is_sound_available"
    t.boolean "is_infrared_available"
    t.boolean "is_flash_available"
    t.integer "max_resolution_width"
    t.integer "max_resolution_height"
    t.integer "camera_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_type_id"], name: "index_camera_brands_on_camera_type_id"
  end

  create_table "camera_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camera_video_formats", force: :cascade do |t|
    t.integer "camera_brand_id"
    t.integer "video_format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_brand_id"], name: "index_camera_video_formats_on_camera_brand_id"
    t.index ["video_format_id"], name: "index_camera_video_formats_on_video_format_id"
  end

  create_table "cameras", force: :cascade do |t|
    t.string "camera"
    t.string "address"
    t.integer "output_width"
    t.integer "output_height"
    t.integer "x"
    t.integer "y"
    t.boolean "is_record_enabled"
    t.boolean "is_enabled"
    t.integer "camera_brand_id"
    t.integer "camera_video_format_id"
    t.integer "location_area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camera_brand_id"], name: "index_cameras_on_camera_brand_id"
    t.index ["camera_video_format_id"], name: "index_cameras_on_camera_video_format_id"
    t.index ["location_area_id"], name: "index_cameras_on_location_area_id"
  end

  create_table "codecs", force: :cascade do |t|
    t.string "codec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_areas", force: :cascade do |t|
    t.string "area"
    t.string "layout"
    t.integer "floor_x"
    t.integer "floor_y"
    t.integer "location_building_floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_building_floor_id"], name: "index_location_areas_on_location_building_floor_id"
  end

  create_table "location_building_floors", force: :cascade do |t|
    t.string "layout"
    t.integer "floor"
    t.integer "location_building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_building_id"], name: "index_location_building_floors_on_location_building_id"
  end

  create_table "location_buildings", force: :cascade do |t|
    t.string "building"
    t.integer "local_x"
    t.integer "local_y"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_buildings_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "location"
    t.string "address"
    t.string "map"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "protocols", force: :cascade do |t|
    t.string "protocol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "video_formats", force: :cascade do |t|
    t.string "format"
    t.integer "codec_id"
    t.integer "protocol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codec_id"], name: "index_video_formats_on_codec_id"
    t.index ["protocol_id"], name: "index_video_formats_on_protocol_id"
  end

end

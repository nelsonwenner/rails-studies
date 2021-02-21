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

ActiveRecord::Schema.define(version: 2021_02_19_173104) do

  create_table "cars", force: :cascade do |t|
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pilots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "races", force: :cascade do |t|
    t.string "date"
    t.integer "total_laps"
    t.string "total_time"
    t.integer "best_lap"
    t.string "time_best_lap"
    t.string "diff"
    t.string "gap"
    t.integer "starting_grid"
    t.decimal "average_velocity", precision: 10, scale: 2
    t.integer "pilot_id", null: false
    t.integer "tournament_id", null: false
    t.integer "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_races_on_car_id"
    t.index ["pilot_id"], name: "index_races_on_pilot_id"
    t.index ["tournament_id"], name: "index_races_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "races", "cars"
  add_foreign_key "races", "pilots"
  add_foreign_key "races", "tournaments"
end

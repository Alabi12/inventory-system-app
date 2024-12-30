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

ActiveRecord::Schema[8.0].define(version: 2024_12_29_125543) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.integer "quantity"
    t.integer "reorder_level"
    t.bigint "warehouse_id", null: false
    t.bigint "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_inventories_on_branch_id"
    t.index ["warehouse_id"], name: "index_inventories_on_warehouse_id"
  end

  create_table "issuances", force: :cascade do |t|
    t.bigint "inventory_id", null: false
    t.bigint "warehouse_id", null: false
    t.bigint "branch_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_issuances_on_branch_id"
    t.index ["inventory_id"], name: "index_issuances_on_inventory_id"
    t.index ["warehouse_id"], name: "index_issuances_on_warehouse_id"
  end

  create_table "stock_movements", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.string "destination_type", null: false
    t.bigint "destination_id", null: false
    t.bigint "inventory_id", null: false
    t.integer "quantity"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["destination_type", "destination_id"], name: "index_stock_movements_on_destination"
    t.index ["inventory_id"], name: "index_stock_movements_on_inventory_id"
    t.index ["source_type", "source_id"], name: "index_stock_movements_on_source"
  end

  create_table "vehicle_movements", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.bigint "warehouse_id", null: false
    t.string "driver"
    t.string "destination"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_movements_on_vehicle_id"
    t.index ["warehouse_id"], name: "index_vehicle_movements_on_warehouse_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vehicle_number"
    t.integer "capacity"
    t.bigint "warehouse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["warehouse_id"], name: "index_vehicles_on_warehouse_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inventories", "branches"
  add_foreign_key "inventories", "warehouses"
  add_foreign_key "issuances", "branches"
  add_foreign_key "issuances", "inventories"
  add_foreign_key "issuances", "warehouses"
  add_foreign_key "stock_movements", "inventories"
  add_foreign_key "vehicle_movements", "vehicles"
  add_foreign_key "vehicle_movements", "warehouses"
  add_foreign_key "vehicles", "warehouses"
end

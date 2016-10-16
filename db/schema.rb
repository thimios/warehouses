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

ActiveRecord::Schema.define(version: 20161014153912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventory_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "warehouse_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["product_id"], name: "index_inventory_items_on_product_id", using: :btree
    t.index ["warehouse_id"], name: "index_inventory_items_on_warehouse_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipment_items", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "shipment_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_shipment_items_on_product_id", using: :btree
    t.index ["shipment_id"], name: "index_shipment_items_on_shipment_id", using: :btree
  end

  create_table "shipments", force: :cascade do |t|
    t.string   "recipient_address"
    t.integer  "warehouse_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["warehouse_id"], name: "index_shipments_on_warehouse_id", using: :btree
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_warehouses_on_company_id", using: :btree
  end

  add_foreign_key "inventory_items", "products"
  add_foreign_key "inventory_items", "warehouses"
  add_foreign_key "shipment_items", "products"
  add_foreign_key "shipment_items", "shipments"
  add_foreign_key "shipments", "warehouses"
  add_foreign_key "warehouses", "companies"
end

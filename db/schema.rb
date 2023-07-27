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

ActiveRecord::Schema[7.0].define(version: 2023_07_25_160627) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "transactions", force: :cascade do |t|
    t.integer "transaction_id", null: false
    t.integer "merchant_id", null: false
    t.integer "user_id", null: false
    t.string "card_number", null: false
    t.datetime "transaction_date", precision: nil, null: false
    t.float "transaction_amount", null: false
    t.integer "device_id"
    t.boolean "has_cbk", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_number"], name: "index_transactions_on_card_number"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

end

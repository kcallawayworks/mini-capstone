class CreateImages < ActiveRecord::Migration[5.2]
  def change
  create_table "images", force: :cascade do |t|
    t.string "url"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    end
  end
end

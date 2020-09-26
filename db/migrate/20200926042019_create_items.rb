class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name          , null: false
      t.string  :seller                , null: false
      t.integer :category_id           , null: false
      t.integer :price                 , null: false
      t.integer :product_status_id     , null: false
      t.integer :delivery_fee_id       , null: false
      t.integer :shipment_source_id    , null: false
      t.integer :shipping_days_id      , null: false
      t.text    :product_text          , null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

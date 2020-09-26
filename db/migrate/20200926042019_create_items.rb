class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :product_name
      t.string  :seller
      t.integer :category
      t.integer :price 
      t.integer :product_status
      t.integer :delivery_fee
      t.integer :shipment_source
      t.integer :shipping_days
      t.text    :product_text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

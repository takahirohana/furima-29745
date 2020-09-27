class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :shipping_day
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :category_id, :product_status, :delivery_fee, :shipment_source, :shipping_days, numericality: { other_than: 1 }
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_text
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, inclusion: {in: 300..9999999}
  end
end

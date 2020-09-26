class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_text
    validates :category
    validates :product_status
    validates :delivery_fee
    validates :shipment_source
    validates :shipping_days
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, inclusion: {in: 300..9999999}
  end
end

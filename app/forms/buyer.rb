class Buyer
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :city, :house_number, :tell, :building_name, :prefecture_id, :purchase_id, :user_id, :item

  # purchaseの分
  validates :token, presence: true

  # shippingaddress分
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :tell, format: { with: /\A\d{11}\z/ }
  end
  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, city: city, house_number: house_number, tell: tell, building_name: building_name, prefecture_id: prefecture.id, :purchase_id: purchase.id)
  end
end
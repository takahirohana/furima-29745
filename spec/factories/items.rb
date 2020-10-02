FactoryBot.define do
  factory :item do
    product_name { "item" }
    product_text { Faker::Lorem.sentence }
    price        { 3000 }
    category_id  { 2 }
    product_status_id { 2 }
    delivery_fee_id { 2 }
    shipment_source_id { 2 }
    shipping_day_id { 2 }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/download-6.jpg'), filename: 'test_image.png')
    end
  end
end
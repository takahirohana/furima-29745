FactoryBot.define do
  factory :item do
    product_name {"item"}
    product_text {Faker::Lurem.sentence}
    price        {3000}
  end
end
FactoryBot.define do
  factory :buyer do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code   { "123-4567"}
    city          { "大阪府" }
    house_number  { "4-4-4" }
    tell          { "09012345678"}
    building_name { "大阪ハイツ" }
    prefecture_id { 2 }
  end
end

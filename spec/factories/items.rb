FactoryBot.define do
  factory :item do
    name { 'ああ' }
    text { 'スズキ' }
    category_id { 2 }
    status_id { 2 }
    prefecture_id { 2 }
    shipping_id { 2 }
    day_id { 2 }
    price { 2000 }
    association :user
  end
end

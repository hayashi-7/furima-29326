FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    city        { '横浜市' }
    house_number { '横浜99' }
    phone_number { '09033334444' }
    prefecture_id { 2 }
    building_name {''}
    token {'hogehoge'}
  end
end

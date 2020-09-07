class Item < ApplicationRecord
  with_options presence: true do
   validates :text
   validates :user
   validates :price, inclusion: {in: 300..9999999 }, format: { with: /^[0-9]+$/ }
   validates :name
   validates :category_id
   validates :status_id
   validates :shipping_id
   validates :prefectuer_id
   validates :day_id
  end
end

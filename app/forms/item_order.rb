class ItemOrder
  include ActiveModel::Model
  attr_accessor :sold, :postal_code, :city, :house_number, :phone_number, :prefecture_id, :token, :building_name, :user_id, :token, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :token
  end

  def save
    item = Item.find(item_id)
    item.update(sold: 1)
    Order.create(postal_code: postal_code, city: city, house_number: house_number, phone_number: phone_number, building_name: building_name, prefecture_id: prefecture_id, user_id: user_id, item_id: item_id)
  end
end
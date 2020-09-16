class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping
  belongs_to_active_hash :status
  belongs_to_active_hash :day
  belongs_to_active_hash :category
  belongs_to :user # optional: true
  has_one_attached :image
  has_one :order
  with_options presence: true do
    validates :text
    validates :user
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :name
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :prefecture_id
    validates :day_id
  end
  validates :category_id, :status_id, :shipping_id, :prefecture_id, :day_id, numericality: { other_than: 1 }
end

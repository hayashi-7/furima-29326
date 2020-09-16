class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token
  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :item
end

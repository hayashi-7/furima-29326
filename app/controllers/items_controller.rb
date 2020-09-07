class ItemsController < ApplicationController
  has_one_attached :image
  def new
    Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit( :image, :text, :price, :name, :category_id, :status_id, :shipping_id, :prefectuer_id, :day_id ).merge(user_id: current_user.id)
  end

end
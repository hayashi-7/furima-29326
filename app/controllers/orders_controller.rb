class OrdersController < ApplicationController
  before_action :authenticate_user!, :order_out
  def index
    @item = Item.find(params[:item_id])
    @order = ItemOrder.new
  end
  
  def create 
    @item = Item.find(params[:item_id])
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def order_params
    params.require(:item_order).permit(:postal_code, :city, :house_number, :phone_number, :building_name, :prefecture_id).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token], 
      currency:'jpy'
    )
  end

  def order_out
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.sold != nil
      redirect_to root_path
    end
  end
end

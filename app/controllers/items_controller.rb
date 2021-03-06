class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit show update destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
   end
  end

  def destroy
    if user_signed_in? && current_user.id == @item.user_id
       if @item.destroy
         redirect_to root_path
       else
         render :show
       end
    else
      redirect_to new_user_session_path
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
       redirect_to item_path
    else
       render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :text, :price, :name, :category_id, :status_id, :shipping_id, :prefecture_id, :day_id, :sold).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

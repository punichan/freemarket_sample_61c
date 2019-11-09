class ItemsController < ApplicationController
  # before action :move_to_signup, expcept: :index

  def index
  end

  def new
    @item = Item.new
    @item.images.build
    # @categories = Category.all
    @prefecture = Prefecture.all
  end

  def create
    @item = Item.create!(item_params)
    redirect_to action: 'index'
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :item_description,
      :price,
      :brand_id,
      :saler_id,
      :category_id,
      :shoes_size_id,
      :clothes_size_id,
      :condition_id, 
      :delivery_way_id,
      :delivery_burden_id,
      :prefecture_id,
      :shipment_days_id,
      :buyer_id,
      image_attributes:[:image])
  end

  # def move_to_signup
  #   redirect_to 'new_user_session_path' unless user_signed_in?
  # end
end

class ItemsController < ApplicationController
  # before action :move_to_signup, expcept: :index

  def index
    a
  end

  def new
    @item = Item.new
    @item.images.build
    # @categories = Category.all
    # @prefecture = Prefecture.all
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
      :category_id,
      :size, 
      :condition,
      :delivery_burden,
      :delivery_way,
      :origin_of_delivery,
      :shipment_days,
      :price, :saler_id,
      :buyer_id,
      image_attributes:[:image])
  end

  # def move_to_signup
  #   redirect_to 'new_user_session_path' unless user_signed_in?
  # end
end

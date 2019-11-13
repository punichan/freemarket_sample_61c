class ItemsController < ApplicationController
  # before action :move_to_signup, expcept: :index

  def index
  end

  def new
    @item = Item.new
    10.times{@item.images.build}
    @categories = Category.all
    @prefecture = Prefecture.all
  end

  def create
    @item = Item.new(item_params)
    @item.saler_id = current_user.id
    if @item.save!
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def edit
    # @item = Item.find(2)
  end

  def destroy
      @item = Item.find(params[:id])
      @item.destroy if @item.saler_id == current_user.id 
      redirect_to action: 'index'
    end

    def exhibition_item
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
      images_attributes: {images:[]})
  end

  def move_to_signup
    redirect_to 'new_user_session_path' unless user_signed_in?
  end
end

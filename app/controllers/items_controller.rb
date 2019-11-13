class ItemsController < ApplicationController
  # before action :move_to_signup, expcept: :index

  def index
  end

  def new
    @item = Item.new
    10.times{@item.images.build}
    @children = []
    @grandchildren = []
    @parents = Category.where("ancestry is NULL")
    @parents.each do |parent|
      @children << parent.children
    end
    @children.each do |child|
      @grandchildren << child[0].children
    end
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

  def purchase
    @item = Item.find(1)
    Payjp.api_key = 'sk_test_909ca763bed848e8c8361068'
    Payjp::Charge.create(
      amount: 3000,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @item.buyer_id = current_user.id
    @item.save
    redirect_to root_path, notice: "支払いが完了しました"
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

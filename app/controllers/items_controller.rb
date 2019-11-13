class ItemsController < ApplicationController
  # before action :move_to_signup, expcept: :index #仮はずし

  def index
    @ladies_category = Item.where(category_id: 1).limit(10)
    @mens_category = Item.where(category_id: 200).limit(10)
    @books_category = Item.where(category_id: 623).limit(10)
    @hobbies_category = Item.where(category_id: 682).limit(10)
    @syane_brand = Item.where(brand_id: 2441).limit(10)
    @ruivi_brand = Item.where(brand_id: 6143).limit(10)
    @syup_brand = Item.where(brand_id: 2462).limit(10)
    @nike_brand = Item.where(brand_id: 3803).limit(10)
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
    @item = Item.find(2)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: 3000,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @item.buyer_id = current_user.id
    @item.save
    redirect_to root_path, notice: "支払いが完了しました"
  end

  def show
    @item = Item.find(30)
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
      images_attributes: [:images])
  end

  def move_to_signup
    redirect_to 'new_user_session_path' unless user_signed_in?
  end
end


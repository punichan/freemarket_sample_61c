class ItemsController < ApplicationController
  # before action :move_to_signup, expcept: :index #仮はずし
  before_action :set_item, only: [:show, :purchase, :buycheck,:details, :edit, :update]
  def show
  end

  def buycheck
  end

  def details
  end



  def index
    @ladies_category = Item.where(category_id: 1..199).limit(10)
    @mens_category = Item.where(category_id: 200..345).limit(10)
    @books_category = Item.where(category_id: 623..681).limit(10)
    @hobbies_category = Item.where(category_id: 682..794).limit(10)
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

  def edit
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

  def update
    @item.update(update_item_params) if @item.saler_id == current_user.id
  end

  def destroy
      @item = Item.find(params[:id])
      if @item.saler_id == current_user.id && @item.destroy
        redirect_to action: 'index'
      else
        redirect_to action: 'edit'
      end
  end

  def exhibition
  end
    
  def purchase
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

  def set_item
    @item = Item.find(params[:id])
  end

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
  def update_item_params
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
      images_attributes: [:images, :_destroy, :id])
  end

  def move_to_signup
    redirect_to 'new_user_session_path' unless user_signed_in?
  end
end


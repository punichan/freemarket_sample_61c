class ItemsController < ApplicationController
  # before action :move_to_signup, expcept: :index

  def index
  end

  def new
    @item = Item.new
    @item.images.build
    # @categories = Category.all
    # @prefecture = Prefecture.all
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require().permit()
  end

  # def move_to_signup
  #   redirect_to 'new_user_session_path' unless user_signed_in?
  # end
end

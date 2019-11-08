class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
    @categories = Category.all
  end
  def create
    
  end

  private
  
end

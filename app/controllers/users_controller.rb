class UsersController < ApplicationController
  def show
  end

  def exhibition
    @items = Item.where(params[:id])
  end

end

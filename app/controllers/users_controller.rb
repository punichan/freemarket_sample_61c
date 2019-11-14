class UsersController < ApplicationController
  def show
  end

  def exhibition
    @items = Item.where(saler_id: current_user.id)
  end

  def selled
    @items = Item.where(saler_id: current_user.id)
  end

end

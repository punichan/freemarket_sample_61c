class UsersController < ApplicationController
  def show
  end

  def exhibition
    @items = Item.where(saler_id: current_user.id)
  end

end

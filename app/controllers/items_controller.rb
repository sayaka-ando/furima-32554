class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def item_params
    params.require(:item).permit(:product, :image).marge(user_id: current_user.id)

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end
end

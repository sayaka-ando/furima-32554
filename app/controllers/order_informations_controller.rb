class OrderInformationsController < ApplicationController

  def index
    @item = Item.find(params[:id])
    @order_form = OrderForm.new
  end

  def create
    binfing.pry
  end
  
end

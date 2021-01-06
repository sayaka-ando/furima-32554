class OrderInformationsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_information_params)
      if @order_form.valid?
        @order_form.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def order_information_params
    params.require(:order_form).permit(:user_id, :item_id, :postal_code, :delivery_area_id, :city, :address, :building, :phone_number, :order_information_id)
  end
  
end

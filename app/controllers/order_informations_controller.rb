class OrderInformationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order_information.present?
      redirect_to root_path
    end
    @order_form = OrderForm.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_information_params)
      if @order_form.valid?
        pay_item
        @order_form.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def order_information_params
    params.require(:order_form).permit(:postal_code, :delivery_area_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_information_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end

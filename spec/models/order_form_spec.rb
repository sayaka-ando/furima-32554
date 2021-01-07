require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入' do
    context '商品購入がうまく行く時' do
      it '郵便番号、都道府県、市町村、番地、電話番号があれば投稿できる' do
        expect(@order_form).to be_valid
      end
    end

    context '商品購入がうまく行かない時' do
      it '郵便番号がないとき' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県がないとき' do
        @order_form.delivery_area_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '市区町村がないとき' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないとき' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないとき' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号にハイフンがないとき' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '電話番号にハイフンがあるとき' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が11桁以上あるとき' do
        @order_form.phone_number = '090111111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end

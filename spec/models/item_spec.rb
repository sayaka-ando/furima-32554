require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '商品投稿がうまく行く時' do
      it '商品名、説明、カテゴリー、状態、配送料、配送エリア、配送日数、価格があれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '商品投稿がうまく行かない時' do
      it '商品画像を1枚つけないと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が無いと投稿できない' do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
     end

      it '商品説明が無いと投稿できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end

      it 'カテゴリーidが1の時登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態についての情報が無いと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end

      it '商品の状態idが1の時登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担についての情報がないと登録できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
      end

      it '配送料の負担idが1の時登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域についての情報がないと登録できない' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '発送元の地域idが0の時登録できない' do
        @item.delivery_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 0")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day is not a number")
      end

      it '発送までの日数idが1の時登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end

      it '価格についての情報がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
      end
      
      it '価格が、¥300より安いと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が、¥9,999,999より高いと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '販売価格は半角数字でないと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    
    end
  end
end

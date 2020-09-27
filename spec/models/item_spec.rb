require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
      @item = FactoryBot.build(:item)
  end

  describe '商品出品する時' do
    context '商品出品がうまくいくとき' do
      it 'product_nameとproduct_textとpriceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end   
    context '商品出品がうまくいかないとき' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名は空だと登録できない' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.product_text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product text can't be blank")
      end
      it 'カテゴリーの情報のidが1だと登録できない' do
        @item.category_id = 1   
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = nil 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態情報のidが1だと登録できない' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status must be other than 1")
      end
      it '商品の状態についての情報がないと登録できない' do
        @item.product_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it '配送料の負担情報のidが1だと登録できない' do
        @item.delivery_fee_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it '配送料の負担の情報が空だと登録できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '発送元の地域についての情報のidが1だと登録できない' do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end
      it '発送元の地域についての情報がないと登録できない' do
        @item.shipment_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end
      it '発送までの日数についての情報のidが1だと登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it '発送までの日数についての情報がないと登録できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '価格についての情報がないと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が、¥300以下だと登録ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が、¥9,999,999以上だと登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格は半角数字以外は登録できないこと(英語)' do
        @item.price = "price"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格は半角数字以外は登録できないこと(全角数字)' do
        @item.price = "３０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end

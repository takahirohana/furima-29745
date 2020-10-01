require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '購入情報入力する時' do
    before do
      @shipping = FactoryBot.build(:shipping_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
    end
    it 'カード情報が空だと保存できないこと' do
    end
    it '有効期限1が空だと保存できないこと' do
    end
    it '有効期限2が空だと保存できないこと' do
    end
    it 'セキュリティコードが空だと保存できないこと' do
    end
    it '郵便番号が空だと保存できないこと' do
    end
    it '郵便番号にはハイフンが無いと登録できないこと' do
    end
    it '郵便番号は数字以外だと登録できないこと(英語)' do
    end
    it '郵便番号は数字以外だと登録できないこと(漢字、ひらがな)' do
    end
    it '都道府県の情報のidが1だと登録できないこと' do
    end
    it '都道府県の情報が空だと登録できないこと' do
    end
    it '市区町村の情報が空だと登録できないこと' do
    end
    it '番地の情報が空だと登録できないこと' do
    end
    it '建物名が空でも登録できること' do
    end
    it '電話番号は空だと登録できないこと' do
    end
    it '電話番号は数字以外だと登録できないこと(英語)' do
    end
    it '電話番号は数字以外だと登録できないこと(漢字、ひらがな)' do
    end
    it '電話番号は12文字以上だと登録できないこと' do
    end
    it '' do
    end
    it '' do
    end
  end
end
    

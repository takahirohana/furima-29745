require 'rails_helper'

RSpec.describe Buyer, type: :model do
  describe '購入情報入力する時' do
    before do
    buy = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id: seller.id)
    item.save
    @buyer = FactoryBot.build(:buyer, user_id: buy.id, item_id: item.id)
    sleep 1
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@buyer).to be_valid
    end
    it 'tokenが空だと登録できないこと' do
      @buyer.token = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @buyer.postal_code = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end
    it '郵便番号にはハイフンが無いと登録できないこと' do
      @buyer.postal_code = "1234567"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code is invalid")
    end
    it '郵便番号は数字以外だと登録できないこと(英語)' do
      @buyer.postal_code = "qwe-euro"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code is invalid")
    end
    it '郵便番号は数字以外だと登録できないこと(漢字、ひらがな)' do
      @buyer.postal_code = "あああ-ああああ"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code is invalid")
    end
    it '郵便番号は7文字より多いと登録できない事' do
      @buyer.postal_code = "123-45678"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code is invalid")
    end
    it '郵便番号は7文字より少ないと登録できない事' do
      @buyer.postal_code = "12-3456"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Postal code is invalid")
    end
    it '都道府県の情報のidが1だと登録できないこと' do
      @buyer.prefecture_id = 1
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '都道府県の情報が空だと登録できないこと' do
      @buyer.prefecture_id = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村の情報が空だと登録できないこと' do
      @buyer.city = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("City can't be blank")
    end
    it '番地の情報が空だと登録できないこと' do
      @buyer.house_number = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("House number can't be blank")
    end
    it '建物名が空でも登録できること' do
      @buyer.building_name = ""
      @buyer.valid?
    end
    it '電話番号は空だと登録できないこと' do
      @buyer.tell = ""
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Tell can't be blank", "Tell is invalid")
    end
    it '電話番号にハイフンがあると登録できないこと' do
      @buyer.tell = "090-1234-5678"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Tell is invalid")
    end
    it '電話番号は12文字以上だと登録できないこと' do
      @buyer.tell = "090123456789"
      @buyer.valid?
      expect(@buyer.errors.full_messages).to include("Tell is invalid")
    end
  end
end



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
      it 'パスワードが６文字以上であれば登録できる' do
      end
      end
    context '商品出品がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do

      end
      it 'emailが空だと登録できない' do

      end
      it '重複したemailが存在する場合登録できない' do

      end
      it 'emailに@マークが含まれていないと登録できない' do

      end
      it 'passwordが空だと登録できない' do

      end
      it 'passwordが５文字以下だと登録できない' do

      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do

      end
      it 'passwordは数字のみだと登録できない' do

      end
      it 'passwordは英語のみだと登録できない' do

      end
      it 'last_nameが空だと登録できない' do

      end
      it 'last_nameが漢字・ひらがな・カタカナ以外が使われていると登録できない' do

      end
      it 'first_nameが空だと登録できない' do

      end
      it 'first_nameが漢字・ひらがな・カタカナ以外が使われていると登録できない' do

      end
      it 'last_name_kanaが空だと登録できない' do

      end
      it 'last_name_kanaにカタカナ以外が使われていると登録できない' do

      end
      it 'first_name_kanaが空だと登録できない' do

      end
      it 'first_name_kanaにカタカナ以外が使われていると登録できない' do

      end
      it '' do

      end
    end
  end
end

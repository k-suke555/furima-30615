require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号を入力してください", "郵便番号にはハイフン(-)が必要です")
    end
    it '郵便番号にはハイフンが必要であること（123-4567となる）' do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号にはハイフン(-)が必要です")
    end
    it '都道府県が空だと保存できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("都道府県を入力してください", "都道府県は---以外を選択してください")
    end
    it '都道府県については---が選択されていると保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("都道府県は---以外を選択してください")
    end
    it '市区町村が空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
    end
    it '番地が空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("番地を入力してください")
    end
    it '建物名は空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）' do
      @order_address.city = "09023456789"
      expect(@order_address).to be_valid
    end
    it '電話番号が11桁以上でハイフンがあると登録できないこと' do
      @order_address.phone_number = "090-1234-56789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号は不正な値です")
    end
  end
end

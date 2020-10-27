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
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にはハイフンが必要であること（123-4567となる）' do
      @order_address.postal_code = "123"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県が空だと保存できないこと' do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '都道府県については---が選択されていると保存できないこと' do
      @order_address.prefecture_id = "---"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it '建物名は空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）' do
      @order_address.city = "09023456789"
      expect(@order_address).to be_valid
    end
    it '電話番号が11桁以上でハイフンがあると登録できないこと' do
      @order_address.phone_number = "090-1234-56789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

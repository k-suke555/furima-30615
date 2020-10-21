require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報が必須であること' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.burden = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.days_to_ship = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end

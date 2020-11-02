require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての情報が正しく入力できていれば保存できること' do
      expect(@item).to be_valid
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '商品の説明が必須であること' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください", "カテゴリーは---以外を選択してください")
    end

    it 'カテゴリーについては---が選択されていると保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは---以外を選択してください')
    end

    it '商品の状態についての情報が必須であること' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください", "商品の状態は---以外を選択してください")
    end

    it '商品の状態については---が選択されていると保存できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は---以外を選択してください')
    end

    it '配送料の負担についての情報が必須であること' do
      @item.burden = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください", "配送料の負担は---以外を選択してください")
    end

    it '配送料の負担については---が選択されていると保存できないこと' do
      @item.burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担は---以外を選択してください')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください", "発送元の地域は---以外を選択してください")
    end

    it '発送元の地域については---が選択されていると保存できないこと' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域は---以外を選択してください')
    end

    it '発送までの日数についての情報が必須であること' do
      @item.days_to_ship = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください", "発送までの日数は---以外を選択してください")
    end

    it '発送までの日数については---が選択されていると保存できないこと' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数は---以外を選択してください')
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください")
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
  end
end

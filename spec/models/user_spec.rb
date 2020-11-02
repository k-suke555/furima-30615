require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'abccom'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'パスワードは6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password_confirmation = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角)の苗字を入力してください", "お名前(全角)の苗字は全角で入力してください")
    end
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角)の名前を入力してください", "お名前(全角)の名前は全角で入力してくだい")
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name_kanji = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前(全角)の苗字は全角で入力してください')
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name_kanji = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前(全角)の名前は全角で入力してくだい')
    end
    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角)の苗字を入力してください", "お名前カナ(全角)の苗字はカタカナ(全角)で入力してください")
    end
    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角)の名前を入力してください", "お名前カナ(全角)の名前はカタカナ(全角)で入力してください")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ(全角)の名前はカタカナ(全角)で入力してください')
    end
    it '誕生日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end

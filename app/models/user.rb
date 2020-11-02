class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  with_options presence: true do
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してくだい' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナ(全角)で入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナ(全角)で入力してください' }
    validates :password, format: { with: /\A[a-z0-9]+\z/i }
    validates :nickname
    validates :birthday
  end
end

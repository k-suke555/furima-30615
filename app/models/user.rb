class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  with_options presence: true do
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Last name Full-width characters' }
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'First name Full-width characters' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Last name Full-width katakana characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'First name Full-width katakana characters' }
    validates :password, format: { with: /\A[a-z0-9]+\z/i }
    validates :nickname
    validates :birthday
  end
end

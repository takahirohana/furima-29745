class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  NAME_REGEX_KANJI = /\A[ぁ-んァ-ン一-龥]+\z/
  NAME_REGEX_KANA = /\A[ァ-ン]+\z/

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :email, format: { with: /@.+/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :password, confirmation: true
    validates :password_confirmation
    validates :last_name, format: { with: NAME_REGEX_KANJI }
    validates :first_name, format: { with: NAME_REGEX_KANJI }
    validates :last_name_kana, format: { with: NAME_REGEX_KANA }
    validates :first_name_kana, format: { with: NAME_REGEX_KANA }
    validates :birthday
  end
end

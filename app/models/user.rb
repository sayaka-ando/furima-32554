class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname,           presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, length: { minimum: 6 }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do 
  validates :family_name,        presence: true
  validates :first_name,         presence: true
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶ一]+\z/ } do
  validates :family_name_kana,   presence: true
  validates :first_name_kana,    presence: true
  end
  
  validates :birthday,           presence: true

  has_many :items
  has_many :buyers

end

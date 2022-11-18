class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :tweets, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comennts
  attachment :profile_image
end
 
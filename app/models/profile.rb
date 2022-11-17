class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :nickname, presence: true
  validates :information, presence: true
end

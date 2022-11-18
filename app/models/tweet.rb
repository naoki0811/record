class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true, unless: :was_attached?
  validates :hashtag, presence: true

  def was_attached?
    self.image.attached?
  end

  def favorited_by?(user)
    favorites.where(user_id: user_id).exists?
  end

end

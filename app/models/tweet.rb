class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :images

  validates :title, presence: true
  validates :text, presence: true, unless: :was_attached?
  validates :images, length: { minimum: 0, maximum: 5, message: 'は0枚以上5枚以下にしてください' }

  def was_attached?
    images.attached?
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ''
      Tweet.where('text LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Tweet.order('created_at DESC')
    end
  end
end

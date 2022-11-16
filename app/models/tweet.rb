class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true, unless: :was_attached?
  validates :hashtag, presence: true

  def was_attached?
    self.image.attached?
  end

end

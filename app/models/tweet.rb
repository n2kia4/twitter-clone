class Tweet < ApplicationRecord
  has_many :likes, dependent: :destroy

  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }

  mount_uploader :photo, PhotoUploader

  default_scope -> { order(created_at: :desc) }

  def liked?(user)
    likes.find_by(user_id: user)
  end

  def self.search(search)
    Tweet.where(['content ILIKE ?', "%#{search}%"])
  end
end

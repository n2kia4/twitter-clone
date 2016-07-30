class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140 }

  mount_uploader :photo, PhotoUploader
end

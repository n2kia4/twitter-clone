class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 20}
  validates :username, presence: true, length: { maximum: 15}, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 160 }
end

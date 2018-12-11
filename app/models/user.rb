class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_one  :gh_user

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def bookmarked_videos
    Tutorial.includes(videos: :user_videos).where(videos: { user_videos: { id: id } })
  end
end
class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_one  :gh_user

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def bookmarked_tutorials
    Tutorial.includes(videos: :user_videos)
    .references(videos: :user_videos)
    .where('user_videos.user_id = ?', id)
    .group('tutorials.id, videos.id, user_videos.id')
    .order('videos.position ASC')
  end
end
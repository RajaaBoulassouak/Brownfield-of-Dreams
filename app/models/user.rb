class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_one :github_token

  has_many :followings
  has_many :followed_users, through: :followings

  has_many :followers, foreign_key: :followed_user_id, class_name: 'Following'
  has_many :follower_users, through: :followers, source: :user

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end
end
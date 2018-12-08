class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_one :github_token

  has_many :friends
  has_many :friended_users, through: :friends

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def add_friend
  end

  # def self.current
  #   Thread.current[:user]
  # end

  # def self.current=(user)
  #   Thread.current[:user] = user
  # end
end
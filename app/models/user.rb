class User < ApplicationRecord
  # before_save :ensure_github_token

  has_many :user_videos
  has_many :videos, through: :user_videos
  has_one :github_token

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def self.find_or_create_from_auth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.save
    end
  end
  
  private 
  
  def ensure_github_token
    self.github_token = GithubToken.find_or_create_by.tap do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.oauth_token = auth.credentials.token
    end
  end
end

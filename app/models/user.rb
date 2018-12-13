class User < ApplicationRecord
  before_save   :downcase_email
  before_create :generate_activation_token
  
  has_many :bookmarks
  has_many :videos, through: :bookmarks
  has_one  :gh_user

  validates :email, uniqueness: true, presence: true
  validates_presence_of :first_name
  validates_presence_of :password
  
  has_secure_password
  
  enum role: [:default, :admin]
  enum status: [:non_activated, :activated]

  def generate_activation_token 
    self.activation_token = SecureRandom.uuid
  end
  
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end 
  
  def activate_account 
    update_attribute(:status, 1)
  end
  
  def bookmarked_tutorials
    Tutorial.includes(videos: :bookmarks)
    .references(videos: :bookmarks)
    .where(videos: {bookmarks:{user_id: id}})
    .group('tutorials.id, videos.id, bookmarks.id')
    .order('videos.position ASC')
  end
  
  private 
  
  def downcase_email
    self.email = email.downcase 
  end
end
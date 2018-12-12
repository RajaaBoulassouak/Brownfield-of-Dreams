class User < ApplicationRecord
  has_many :bookmarks
  has_many :videos, through: :bookmarks
  has_one  :gh_user

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  def bookmarked_tutorials
    Tutorial.includes(videos: :bookmarks)
    .references(videos: :bookmarks)
    .where(videos: {bookmarks:{user_id: id}})
    .group('tutorials.id, videos.id, bookmarks.id')
    .order('videos.position ASC')
  end
end
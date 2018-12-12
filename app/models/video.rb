class Video < ApplicationRecord
  validates_presence_of :position
  
  belongs_to :tutorial
  has_many :bookmarks
  has_many :users, through: :bookmarks
end

class GhUser < ApplicationRecord
  belongs_to :user
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :gh_user
  
   def self.find_or_create_from_auth(auth, id)
      where(gh_id: auth['uid']).first_or_initialize.tap do |gh_user|
         gh_user.gh_id   = auth['uid']
         gh_user.name    = auth["info"]["nickname"]
         gh_user.link    = auth["info"]["url"]
         gh_user.user_id = id
         gh_user.token   = auth["credentials"]["token"]
         gh_user.save!
      end
   end
end
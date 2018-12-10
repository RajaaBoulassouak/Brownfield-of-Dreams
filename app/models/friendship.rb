class Friendship < ApplicationRecord
  belongs_to :gh_user
  belongs_to :friend, :class_name => "GhUser"
end

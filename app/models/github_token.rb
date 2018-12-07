class GithubToken < ApplicationRecord
  belongs_to :user
  
  # def self.find_or_create_from_auth_hash(auth)
	# 	where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |github_token|
  #     github_token.user_id  = current_user.id
  #     github_token.uid      = auth["id"]
  #     github_token.token    = token
	# 		github_token.save!
	# 	end
	# end
end
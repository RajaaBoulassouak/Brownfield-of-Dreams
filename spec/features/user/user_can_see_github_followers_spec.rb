require 'rails_helper'

describe 'User visits /dashboard' do
  describe 'and sees Followers section under GitHub section in dashboard' do
    it 'displays user followers' do
      user = create(:user, token: ENV['hb_github_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # As a logged in user

      visit '/dashboard'
      # When I visit /dashboard
      expect(current_path).to eq(dashboard_path)
      
      expect(page).to have_content("Github")
      # Then I should see a section for "Github"
      expect(page).to have_content("Followers")
      # And under that section I should see another section titled "Followers"
      expect(page).to have_link(" ")
      # And I should see list of all followers with their handles linking to their Github profile


    end
  end
end

# API endpoint documentation
# https://developer.github.com/v3/users/followers/

#   API call uses authenticated call: /user/followers instead of /users/:username/followers
#   No hashes in the view.
#   Uses objects in the view to represent the followers.
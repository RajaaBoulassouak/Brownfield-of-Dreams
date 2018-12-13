require 'rails_helper'

feature 'User can see a list of their Github followers' do
  scenario 'with the name of each follower linking to their profile on Github' do
    VCR.use_cassette('GitHub Feature User Sees Followers') do
      user = create(:user)
      GhUser.create(token: ENV['USER_GITHUB_TOKEN_1'], user_id: user.id)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Github")
      expect(page).to have_content("Followers")
      within(first(".follower")) do 
        expect(page).to have_css(".name")
        expect(page).to have_link("andrewetobin")
      end
    end
  end
end
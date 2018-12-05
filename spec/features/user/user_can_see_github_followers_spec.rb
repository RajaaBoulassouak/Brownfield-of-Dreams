require 'rails_helper'

describe 'User visits /dashboard' do
  describe 'and sees Followers section under GitHub section in dashboard' do
    it 'displays user followers' do
      user = create(:user, token: ENV['GITHUB_TOKEN'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      expect(current_path).to eq(dashboard_path)
      
      expect(page).to have_content("Github")
      expect(page).to have_content("Followers")
      
      within(first(".followers")) do
        expect(page).to have_css(".follower-name")
        expect(page).to have_link("andrewetobin")
        click_link "andrewetobin"
        expect(current_path).to eq("/andrewetobin")
      end
    end
  end
end



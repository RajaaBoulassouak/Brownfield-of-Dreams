require 'rails_helper'

describe 'User visits /dashboard' do
  describe 'and sees Following section under Github section' do
    it 'displays the names of those the user is following' do

      user = create(:user, token: ENV['GITHUB_TOKEN'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'

      expect(current_path).to eq(dashboard_path)
      
      expect(page).to have_content("Following")
      
      within(first(".following")) do
        expect(page).to have_css(".following-name")
        expect(page).to have_link("MacInnes")
        click_link "MacInnes"
        expect(current_path).to eq("/MacInnes")
      end
    end
  end
end

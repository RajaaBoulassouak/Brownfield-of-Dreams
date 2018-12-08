require 'rails_helper'

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
    {
    "provider" => "GitHub_Mock",
    "uid" => "12345678910",
    "credentials" => {
      "token" => "abcdefg12345"
    }
  }
)

feature 'GitHub OmniAuth' do
  scenario 'user can connect to Github' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'
 
    click_link 'Connect to Github'

    # visit '/auth/github/callback'

    # expect(page).to_not have_button('Connect to Github')

    expect(page).to have_content('Repositories')
    expect(page).to have_content('Followers')
  end
end
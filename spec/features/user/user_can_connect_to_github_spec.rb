require 'rails_helper'

feature 'GitHub OmniAuth' do
  scenario 'user can connect to Github' do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    stub_omniauth

    visit '/dashboard'
 
    click_button 'Connect to Github'

    # visit '/auth/github/callback'

    # expect(page).to_not have_button('Connect to Github')

    expect(page).to have_content('Repositories')
    expect(page).to have_content('Followers')
  end
end
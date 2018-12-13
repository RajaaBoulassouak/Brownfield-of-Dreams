require 'rails_helper'

feature 'GitHub OmniAuth' do
  scenario 'user can authorize through Github' do
    stub_omniauth 
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit '/dashboard'
    
    click_button 'Connect to Github'

    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.email)
  end
end

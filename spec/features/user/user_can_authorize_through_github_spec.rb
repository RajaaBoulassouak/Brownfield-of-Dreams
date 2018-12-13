# require 'rails_helper'

# feature 'GitHub OmniAuth' do
#   scenario 'user can authorize through Github' do
#     user = create(:user)
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
#     stub_omniauth
        
#     visit '/dashboard'
#     click_on 'Connect to Github'
 
#     expect(current_path).to eq(dashboard_path)
#     expect(page).to_not have_button('Connect to Github')
#     expect(page).to have_content('Repositories')
#     expect(page).to have_content('Following')
#     expect(page).to have_content('Followers')
#   end
# end

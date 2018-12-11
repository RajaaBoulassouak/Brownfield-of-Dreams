require 'rails_helper'

feature 'GitHub OmniAuth' do
  it 'user can authorize through Github' do
    stub_omniauth
    user = create(:user) 

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit '/dashboard'
    
    click_on('Connect to Github')

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_button('Connect to Github')
    expect(page).to have_content('Repositories')
    expect(page).to have_content('Following')
    expect(page).to have_content('Followers')
  end
  
  def stub_omniauth
    auth = {
      'uid'         => '37811063',
      'info'        => {
        'nickname' => 'hbellows'
      },
      'extra'       => {
        'raw_info' => {
          'html_url'   => 'https://github.com/HBellows'
        }
      },
      'credentials' => 
      { 
        'token' => ENV['USER_GITHUB_TOKEN_2']
      }
    }
    
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth, id)
  end
end
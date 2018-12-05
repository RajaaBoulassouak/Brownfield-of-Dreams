require 'rails_helper'

describe 'User' do
  it 'user can sign in' do
    user = create(:user, token: "#{ENV['hb_github_token']}")
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Github Repositories")
    expect(page).to have_css(".repo", count: 5)
    save_and_open_page
    
    within(first(".repo")) do 
      expect(page).to have_css(".name")
    #   expect(page).to have_link("trelora_consult_app")
    end
    # click_link "trelora_consult_app"
    # expect(current_path).to eq("/Autumn-Martin/trelora_consult_app")
  end

  xit 'shows the correct repos for the logged in user in a multiple user environment' do
    user = create(:user, token: "Rajaa's token ")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard' 
    
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Github Repositories")
    expect(page).to have_css(".repo", count: 5)
    
    within(first(".repo")) do 
      expect(page).to have_css(".name")
      expect(page).to have_link("trelora_consult_app")
    end
    click_link "trelora_consult_app"
    expect(current_path).to eq("/Autumn-Martin/trelora_consult_app")
  end

  xit 'does not display the GitHub section if the user is missing a GitHub token' do
    
  end
end


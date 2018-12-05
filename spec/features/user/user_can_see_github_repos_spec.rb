require 'rails_helper'

describe 'User visits /dashboard' do
  it 'shows GitHub section on user dashboard'  do
    user = create(:user, token: ENV['hb_github_token'])
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Github Repositories")
    expect(page).to have_css(".repo", count: 5)
    
    
    within(first(".repo")) do 
      expect(page).to have_css(".name")
      expect(page).to have_link("night_writer")
    end
    click_link "night_writer"
    expect(current_path).to eq("/Autumn-Martin/night_writer")
  end

  xit 'shows the correct repos for the logged in user in a multiple user environment' do
    user = create(:user, token: ENV["Rajaa's token"])
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

  it 'does not display the GitHub section if the user is missing a GitHub token' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)

    expect(page).to_not have_content("Github Repositories")

    expect(page).to have_content("Bookmarked Segments")
    expect(page).to have_content("#{user.first_name}")
  end
end


require 'rails_helper'

feature 'User can see a list of 5 of their Github repositories' do
  scenario 'with the name of each Repo linking to the repo on Github' do
    user = create(:user)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Github")
    expect(page).to have_content("Repositories")
    expect(page).to have_css(".repo", count: 5)
    
    within(first(".repo")) do 
      expect(page).to have_css(".name")
      expect(page).to have_link("trelora_consult_app")
    end
    click_link "trelora_consult_app"
    expect(current_path).to eq("/Autumn-Martin/trelora_consult_app")
  end
end

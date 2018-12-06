require 'rails_helper'

feature 'User can see a list of their Github followed users' do
  scenario 'with the name of each followed user linking to their profile on Github' do
    user = create(:user)
    github_token = GithubToken.create(token: ENV['USER_GITHUB_TOKEN_2'], user_id: user.id)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Github")
     expect(page).to have_content("Following")
    
    within(first(".followed_user")) do 
      expect(page).to have_css(".name")
      expect(page).to have_link("MacInnes")
      click_link "MacInnes"
    end
    expect(current_path).to eq("/MacInnes")
  end
end
require 'rails_helper'

feature 'User can see a list of 5 of their Github repositories' do
  scenario 'with the name of each Repo linking to the repo on Github' do
    user = create(:user)
    github_token = GithubToken.create(token: ENV['GITHUB_TOKEN'], user_id: user.id)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Github")
     expect(page).to have_content("Repositories")
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

feature 'User can not see a list of 5 of their Github repositories' do
  scenario 'if they do not have their github token saved in the databae' do
    user = create(:user)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_content("Github")
  end 
end 

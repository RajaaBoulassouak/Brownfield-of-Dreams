require 'rails_helper'

feature 'User can see a list of all their Github followers' do
  scenario 'with the followers handles linking to their Github profile' do
    user = create(:user)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Followers")
    
    within(first(".follower")) do 
      expect(page).to have_css(".name")
      expect(page).to have_link("andrewetobin")
    end
    click_link "andrewetobin"
     expect(current_path).to eq('/andrewetobin')
  end
end

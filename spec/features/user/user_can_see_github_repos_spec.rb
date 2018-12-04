require 'rails_helper'

describe 'User' do
  it 'user can sign in' do
    user = create(:user)
    
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
    expect(current_path).to eq("https://github.com/Autumn-Martin/trelora_consult_app")
  end
end

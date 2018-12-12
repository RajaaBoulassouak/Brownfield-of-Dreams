require 'rails_helper'

feature "User can see link 'Add as friend' next to their Github follower" do
  scenario 'if follower is saved to the gh_user table of the Turing Video Tutorials database' do
    user_1 = create(:user)
    user_2 = create(:user)
    gh_user_1 = GhUser.create(gh_id: 39357526, name: 'RajaaBoulassouak', link: 'https://github.com/RajaaBoulassouak', token: ENV['USER_GITHUB_TOKEN_1'], user_id: user_1.id)
    gh_user_2 = GhUser.create(gh_id: 37811063, name: 'andrewetobin', link: 'https://github.com/andrewetobin', token: ENV['USER_GITHUB_TOKEN_1'], user_id: user_2.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    
    visit '/dashboard'
    
    expect(current_path).to eq('/dashboard')
    within(first('.follower')) do 
      expect(page).to have_link(gh_user_2.name)
      expect(page).to have_button('Add as Friend')
    end
    
    click_on 'Add as Friend'
    
    expect(current_path).to eq('/dashboard')
    within(first(".friend")) do 
      expect(page).to have_link(gh_user_2.name)
    end
  end
end

feature "User can not see link 'Add as friend' next to their Github follower" do
  scenario 'if follower is not saved to the gh_user table of the Turing Video Tutorials database' do
    user_1 = create(:user)
    user_2 = create(:user)
    gh_user_1 = GhUser.create(gh_id: 39357526, name: 'RajaaBoulassouak', link: 'https://github.com/RajaaBoulassouak', token: ENV['USER_GITHUB_TOKEN_1'], user_id: user_1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    within(first('.follower')) do 
      expect(page).to have_link('andrewetobin')
      expect(page).to_not have_button('Add as Friend')
    end
  end
end

feature 'User sends request to create a friendship after deleting follower from db' do
  scenario 'they receive an error message' do
    user_1 = create(:user)
    user_2 = create(:user)
    gh_user_1 = GhUser.create(gh_id: 39357526, name: 'RajaaBoulassouak', link: 'https://github.com/RajaaBoulassouak', token: ENV['USER_GITHUB_TOKEN_1'], user_id: user_1.id)
    gh_user_2 = GhUser.create(gh_id: 37811063, name: 'andrewetobin', link: 'https://github.com/andrewetobin', token: ENV['USER_GITHUB_TOKEN_1'], user_id: user_2.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit '/dashboard'
    
    expect(current_path).to eq('/dashboard')

    gh_user_2.delete

    within(first('.follower')) do 
      expect(page).to have_link(gh_user_2.name)
      expect(page).to have_button('Add as Friend')
    end

    click_on 'Add as Friend'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Invalid user id.')
    within(".friends") do 
      expect(page).to_not have_link(gh_user_2.name)
    end
  end
end

feature 'User sends an invalid user id to create a firendship' do
  scenario 'they receive an error message allerting them' do
    user_1 = create(:user)
    user_2 = create(:user)
    gh_user_1 = GhUser.create(gh_id: 39357526, name: 'RajaaBoulassouak', link: 'https://github.com/RajaaBoulassouak', token: ENV['USER_GITHUB_TOKEN_1'], user_id: user_1.id)
    gh_user_2 = GhUser.create(gh_id: 37811063, name: 'andrewetobin', link: 'https://github.com/andrewetobin', token: ENV['USER_GITHUB_TOKEN_1'], user_id: user_2.id)
    id = 12
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    page.driver.post("/friendships/#{id}")
    click_on("redirected")
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Invalid user id.')
    within(".friends") do 
      expect(page).to_not have_link(gh_user_2.name)
    end
  end
end
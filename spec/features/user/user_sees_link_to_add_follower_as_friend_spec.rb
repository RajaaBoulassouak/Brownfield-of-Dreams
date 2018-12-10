require 'rails_helper'

feature "User can see link 'Add as firend' next to their Github follower" do
  scenario 'if follower has also an account with Turing Video Tutorials' do
    
    user = create(:user)
    github_token = GithubToken.create(token: ENV['USER_GITHUB_TOKEN_1'], user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq('/dashboard')
    within(first(".friend")) do 
      expect(page).to have_link("Add as a friend")
    end
  end
end
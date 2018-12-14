require 'rails_helper'

describe UserDashboardFacade do 
  it 'exists' do 
    user = create(:user)
    GhUser.create(token: ENV['USER_GITHUB_TOKEN_1'], user_id: user.id)
    facade = UserDashboardFacade.new(user)
    
    expect(facade).to be_a(UserDashboardFacade)
  end
  
  it 'has repos' do 
    user = create(:user)
    GhUser.create(token: ENV['USER_GITHUB_TOKEN_1'], user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    result = UserDashboardFacade.new(user)
  
    expect(result.repos.count).to eq(5)
    expect(result.repos).to be_a(Array)
    expect(result.repos.first).to be_a(Repo)
    expect(result.repos.last).to be_a(Repo)
  end 
  
  it 'has followers' do 
    user = create(:user)
    GhUser.create(token: ENV['USER_GITHUB_TOKEN_1'], user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    result = UserDashboardFacade.new(user)
  
    expect(result.followers).to be_a(Array)
    expect(result.followers.first).to be_a(GithubMember)
    expect(result.followers.last).to be_a(GithubMember)
  end 
  
  it 'has followed users' do 
    user = create(:user)
    GhUser.create(token: ENV['USER_GITHUB_TOKEN_2'], user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    result = UserDashboardFacade.new(user)
  
    expect(result.followed_users).to be_a(Array)
    expect(result.followed_users.first).to be_a(GithubMember)
    expect(result.followed_users.last).to be_a(GithubMember)
  end 
end
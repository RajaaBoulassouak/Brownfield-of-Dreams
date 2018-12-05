require 'rails_helper'

describe UserDashboardFacade do 
  it 'exists' do 
    user = create(:user)
    github_token = GithubToken.create(token: ENV['GITHUB_TOKEN'], user_id: user.id)
    
    facade = UserDashboardFacade.new(user)
    
    expect(facade).to be_a(UserDashboardFacade)
  end
  
  it 'has repos' do 
    user = create(:user)
    github_token = GithubToken.create(token: ENV['GITHUB_TOKEN'], user_id: user.id)
  
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  
    result = UserDashboardFacade.new(user)
  
    expect(result.repos.count).to eq(5)
    expect(result.repos).to be_a(Array)
    expect(result.repos.first).to be_a(Repo)
    expect(result.repos.last).to be_a(Repo)
  end 
end
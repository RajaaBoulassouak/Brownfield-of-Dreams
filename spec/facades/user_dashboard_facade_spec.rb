require 'rails_helper'

describe UserDashboardFacade do 
  it 'exists' do 
    current_user = create(:user, token: ENV['GITHUB_TOKEN'])
    facade = UserDashboardFacade.new(current_user)
    
    expect(facade).to be_a(UserDashboardFacade)
  end
  
  it 'has repos' do 
    current_user = create(:user, token: ENV['GITHUB_TOKEN'])
    result = UserDashboardFacade.new(current_user)
    
    expect(result.repos.count).to eq(5)
    expect(result.repos).to be_a(Array)
    expect(result.repos.first).to be_a(Repo)
    expect(result.repos.last).to be_a(Repo)
  end 

  it 'has followers' do 
    current_user = create(:user, token: ENV['GITHUB_TOKEN'])
    result = UserDashboardFacade.new(current_user)
    
    expect(result.followers).to be_a(Array)
    expect(result.followers.first).to be_a(Follower)
    expect(result.followers.last).to be_a(Follower)
  end 
end
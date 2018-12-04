require 'rails_helper'

describe UserDashboardFacade do 
  it 'exists' do 
    facade = UserDashboardFacade.new
    
    expect(facade).to be_a(UserDashboardFacade)
  end
  
  it 'has repos' do 
    result = UserDashboardFacade.new
    
    expect(result.repos.count).to eq(5)
    expect(result.repos).to be_a(Array)
    expect(result.repos.first).to be_a(Repo)
    expect(result.repos.last).to be_a(Repo)
  end 
end
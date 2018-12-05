require 'rails_helper'

describe GithubService do 
  it 'exists' do
    user = create(:user, token: ENV['GITHUB_TOKEN'])
    service = GithubService.new(user)

    expect(service).to be_a(GithubService)
  end

  it 'gets data' do 
    user = create(:user, token: ENV['GITHUB_TOKEN'])
    service = GithubService.new(user)
    github_data = service.get_repos

    expect(github_data).to be_a(Array)
    expect(github_data.count).to eq(5)
    # expect(github_data.first[:name]).to eq("trelora_consult_app")
  end 

  it 'gets data' do 
    user = create(:user, token: ENV['GITHUB_TOKEN'])
    service = GithubService.new(user)
    github_data = service.get_followers

    expect(github_data).to be_a(Array)
    expect(github_data[0][:login]).to be_a(String)
    expect(github_data[0][:id]).to be_a(Integer)
    expect(github_data[0][:type]).to eq("User")
  end 
end

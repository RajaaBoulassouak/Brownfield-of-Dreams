require 'rails_helper'

describe GithubService do 
  it 'exists' do
    service = GithubService.new 

    expect(service).to be_a(GithubService)
  end

  it 'gets data' do 
    service = GithubService.new 

    github_data = service.get_repos

    expect(github_data).to be_a(Array)
    expect(github_data.count).to eq(30)
    expect(github_data.first[:name]).to eq("trelora_consult_app")
  end 
end

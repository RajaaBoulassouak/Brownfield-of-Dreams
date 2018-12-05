require 'rails_helper'

describe GithubService do 
  it 'exists' do
    service = GithubService.new 

    expect(service).to be_a(GithubService)
  end

  it 'gets repos data' do 
    service = GithubService.new 
    repos_data = service.get_repos

    expect(repos_data).to be_a(Array)
    expect(repos_data.count).to eq(30)
    expect(repos_data.first[:name]).to eq("trelora_consult_app")
  end 
end

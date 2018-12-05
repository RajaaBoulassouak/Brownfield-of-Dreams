require 'rails_helper'

describe GithubService do 
  it 'exists' do
    service = GithubService.new(ENV['USER_GITHUB_TOKEN_1'])

    expect(service).to be_a(GithubService)
  end

  it 'gets repos data' do 
    service = GithubService.new(ENV['USER_GITHUB_TOKEN_1'])
    repos_data = service.get_repos

    expect(repos_data).to be_a(Array)
    expect(repos_data.count).to eq(5)
    expect(repos_data.first).to be_a(Hash)
    expect(repos_data.first[:name]).to eq("trelora_consult_app")
  end
end

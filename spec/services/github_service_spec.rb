require 'rails_helper'

describe GithubService do 
  it 'exists' do
    VCR.use_cassette('GitHub Service Exists') do
      service = GithubService.new(ENV['USER_GITHUB_TOKEN_1'])

      expect(service).to be_a(GithubService)
    end
  end

  it 'gets repos data' do 
    VCR.use_cassette('GitHub Service Repo Data') do
      service = GithubService.new(ENV['USER_GITHUB_TOKEN_1'])
      repos_data = service.get_repos

      expect(repos_data).to be_a(Array)
      expect(repos_data.count).to eq(5)
      expect(repos_data.first).to be_a(Hash)
      expect(repos_data.first[:name]).to eq("trelora_consult_app")
    end
  end

  it 'gets followers data' do 
    VCR.use_cassette('GitHub Service Follower Data') do
      service = GithubService.new(ENV['USER_GITHUB_TOKEN_1'])
      followers_data = service.get_followers

      expect(followers_data).to be_a(Array)
      expect(followers_data.first).to be_a(Hash)
      expect(followers_data.first[:login]).to eq("andrewetobin")
    end
  end
  
  it 'gets followed users data' do 
    VCR.use_cassette('GitHub Service Followed User Data') do
      service = GithubService.new(ENV['USER_GITHUB_TOKEN_2'])
      followed_users = service.get_followed_users

      expect(followed_users).to be_a(Array)
      expect(followed_users.first).to be_a(Hash)
      expect(followed_users.first[:login]).to eq("MacInnes")
    end
  end
end

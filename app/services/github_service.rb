class GithubService
  
  def initialize(token)
    @token = token
  end
  
  def get_repos
    get_json("/user/repos?per_page=5")
  end

  def get_followers
    get_json("/user/followers")
  end
  
  def get_followed_users
    get_json("/user/following")
  end

  def get_members(github_handle)
    get_json("/users/#{github_handle}")
  end
  
  private
  def get_json(url)
    @response ||= conn.get(url)
    @parsed ||= JSON.parse(@response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.headers['Authorization'] = "token #{@token}"
      faraday.adapter  Faraday.default_adapter
    end
  end
end

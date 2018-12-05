class GithubService

  def initialize(token)
    @token = token
  end
  
  def initialize(token)
    @token = token
  end
  
  def get_repos
    get_json("/user/repos?per_page=5")
  end
  
  private
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.headers['Authorization'] = "token #{@token}"
      faraday.adapter  Faraday.default_adapter
    end
  end
end

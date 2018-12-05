class GithubService

  def initialize(current_user)
    @current_user = current_user
  end
  
  def get_repos
    get_json("/user/repos?page=1&per_page=5")
  end

  def get_followers
    get_json("/user/followers")
  end
  
  private
  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.github.com') do |faraday|
      faraday.headers['Authorization'] = "token #{@current_user.token}"
      faraday.adapter  Faraday.default_adapter
    end
  end
end

class GithubService
  
  def get_repos
    get_json("/user/repos")
  end
  
  private
  def get_json(url)
    @response ||= conn.get(url)
    @parsed ||= JSON.parse(@response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.headers['Authorization'] = ENV['GITHUB_TOKEN']
      faraday.adapter  Faraday.default_adapter
    end
  end
end

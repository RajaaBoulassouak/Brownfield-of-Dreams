class UserDashboardFacade
  
  def initialize()
  end
  
  def repos
    repos_result[0..4].map do |repo_data|
      Repo.new(repo_data)
    end
  end
  
  def followers
    followers_result.map do |follower_data|
      Follower.new(follower_data)
    end
  end
  
  private
  def repos_result
    @repos_result ||= github_service.get_repos
  end
  
  def followers_result
    @followers_result ||= github_service.get_followers
  end

  def github_service
    GithubService.new
  end
end
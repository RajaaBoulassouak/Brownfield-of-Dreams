class UserDashboardFacade
  
  def initialize(current_user)
    @current_user = current_user
  end
  
  def repos
    result.map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def followers
    followers_data.map do |follower_data|
      Follower.new(follower_data)
    end
  end
  
  private
  def result
    @result ||= github_service.get_repos
  end

  def followers_data
    @followers ||= github_service.get_followers
  end
  
  def github_service
    GithubService.new(@current_user)
  end
end
class UserDashboardFacade
  
  def initialize(user)
    @github_token = user.gh_user.token
  end
  
  def repos
    repos_result.map do |repo_data|
      Repo.new(repo_data)
    end
  end

  def followers
    followers_result.map do |follower_data|
      Follower.new(follower_data)
    end
  end
  
  def followed_users
    followed_users_result.map do |user_data|
      FollowedUser.new(user_data)
    end 
  end
  
  private
  def repos_result
    @repos_result ||= github_service.get_repos
  end

  def followers_result
    @followers_result ||= github_service.get_followers
  end
  
  def followed_users_result 
    @followed_users_result ||= github_service.get_followed_users
  end
  
  def github_service
    GithubService.new(@github_token)
  end
end
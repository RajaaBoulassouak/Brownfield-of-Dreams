class UserDashboardFacade
  
  def initialize(user)
    @user = user
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

  def following
    followed_users_data.map do |user|
      FollowedUser.new(user)
    end
  end
  
  private
  def result
    @result ||= github_service.get_repos
  end

  def followers_data
    @followers ||= github_service.get_followers
  end

  def followed_users_data
    @followed_user ||= github_service.get_followed_users
  end
  
  def github_service
    GithubService.new(@user.token)
  end
end
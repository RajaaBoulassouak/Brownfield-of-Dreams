class UserDashboardFacade
  
  def initialize(user)
    @github_token = user.github_token.token
  end
  
  def repos
    result.map do |repo_data|
      Repo.new(repo_data)
    end
  end
  
  private
  def result
    @result ||= github_service.get_repos
  end
  
  def github_service
    GithubService.new(@github_token)
  end
end
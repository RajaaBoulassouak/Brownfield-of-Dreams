class UserDashboardFacade
  
  def initialize(current_user)
    @current_user = current_user
  end
  
  def repos
    result[0..4].map do |repo_data|
      Repo.new(repo_data)
    end
  end
  
  private
  def result
    @result ||= github_service.get_repos
  end
  
  def github_service
    GithubService.new(@current_user)
  end
end
class UserDashboardFacade
  
  def initialize()
  end
  
  def repos 
    data = github_service.get_repos
    data.map do |repo_data|
      Repo.new(repo_data)
    end
  end
  
  private
  def github_service
    GithubService.new
  end 
end 
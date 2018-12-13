class GithubMemberSearchFacade
  def initialize(github_handle)
    @github_handle = github_handle
  end

    
  def github_member_email
    github_member_result[:email] 
  end

  def send_invite
    
  end

  private
  def github_member_result
    @github_member_result ||= github_service.get_members(@github_handle)
  end
  
  def github_service
    GithubService.new(ENV["USER_GITHUB_TOKEN_2"])
  end
end
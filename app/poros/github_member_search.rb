class GithubMemberSearch
  
  def initialize(github_handle, token)
    @github_handle = github_handle
    @token = token
  end

  def github_member_info
    GithubMember.new(github_member_result)
  end

  private
  def github_member_result
    @github_member_result ||= github_service.get_members(@github_handle)
  end
  
  def github_service
    GithubService.new(@token)
  end
end
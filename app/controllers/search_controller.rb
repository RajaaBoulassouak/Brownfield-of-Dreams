class SearchController < ApplicationController
  def index
    @github_member = GithubMemberSearchFacade.new(params[:github_handle])
    @github_member.github_member_email?
    redirect_to dashboard_path
  end
end
class SearchController < ApplicationController
  def index
    token = current_user.gh_user.token
    member_info = GithubMemberSearch.new(params[:github_handle], token)
    @invitee_info = member_info.github_member_info
    if @invitee_info.email.present?
      InviteMailer.invitation(@invitee_info, current_user)
      flash[:success] = "Successfully sent invite!"
      redirect_to dashboard_path
    else
      flash[:danger] = "The Github user you selected doesn’t have an email address associated with their account."
      redirect_to dashboard_path
    end
  end
end

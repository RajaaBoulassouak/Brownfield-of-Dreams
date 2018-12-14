class SearchController < ApplicationController
  def index
    token = current_user.gh_user.token
    @invitee_info = GithubMemberSearch.new(params[:github_handle], token).github_member_info
    binding.pry
    if @invitee_info.email.present?
      flash[:success] = "Successfully sent invite!"
      InviteMailer.new(@invitee_info)
    else

    redirect_to dashboard_path
    end
  end
end

# Hello <INVITEE_NAME_AS_IT_APPEARS_ON_GITHUB>,

# <INVITER_NAME_AS_IT_APPEARS_ON_GITHUB> has invited you to join <YOUR_APP_NAME>. 
# You can create an account <here (should be a link to /signup)>.
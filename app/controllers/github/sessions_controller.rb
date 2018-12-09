class Github::SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    GithubToken.find_or_create_by(auth, current_user)
      # gh_user_id: auth['uid'],
      # token: auth['credentials']['token'],
      # user_id: current_user.id
      # )
    redirect_to '/dashboard'
  end

  # def create
  #   auth = request.env["omniauth.auth"]
  #   GithubToken.find_or_create_from_auth(auth)    
  #   redirect_to '/dashboard'
  # end
end


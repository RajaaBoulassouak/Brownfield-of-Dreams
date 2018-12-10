class Github::SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    id = current_user.id
    GithubToken.find_or_create_from_auth(auth, id)
    redirect_to '/dashboard'
  end
end


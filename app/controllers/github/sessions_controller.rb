class Github::SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    def create
      auth = request.env["omniauth.auth"]
      GithubToken.find_or_create_by(auth, current_user)
      redirect_to '/dashboard'
    end
end


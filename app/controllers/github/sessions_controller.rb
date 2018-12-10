class Github::SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    GhUser.find_or_create_from_auth(auth)    
    redirect_to '/dashboard'
  end
end


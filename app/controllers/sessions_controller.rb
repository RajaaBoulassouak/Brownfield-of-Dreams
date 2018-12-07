class SessionsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    if params[:provider].present?
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:notice] = "Logged in as #{user.first_name}"
      redirect_to dashboard_path
    else
      hand_roll_login
    end
  end
  
  def destroy
    session.clear
    redirect_to root_path
  end

  private
    
  def hand_roll_login
    user = User.find_by(email: params[:session][:email])
    # Find existing user by email
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Looks like your email or password is invalid"
      render :new
    end
  end
end

class UsersController < ApplicationController
  def show
    unless current_user.gh_user == nil
      @facade = UserDashboardFacade.new(current_user)
    end
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      UserMailer.account_activation(user).deliver_now
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end

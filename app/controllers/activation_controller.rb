class ActivationController < ApplicationController
  def edit
    user = User.find_by(activation_token: params[:id])
    user.activate_account
    session[:id] = user.id
    flash[:success] = "Thank you! Your account is now activated."
    redirect_to dashboard_path
  end
end
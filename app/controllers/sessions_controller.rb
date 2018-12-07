class SessionsController < ApplicationController
  def new
    @user ||= User.new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    # Find existing user by email
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Looks like your email or password is invalid"
      render :new
    end

    auth = request.env['omniauth.auth']
    # Find an identity here
    @github_token = GithubToken.find_with_omniauth(auth)

    if @github_token.nil?
      # If no identity was found, create a brand new one here
      @github_token = GithubToken.create_with_omniauth(auth)
    end

    if signed_in?
      if @github_token.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it 
        # is the current user. So the identity is already associated with 
        # this user. So let's display an error message.
        redirect_to root_url, notice: "Already linked that account!"
      else
        # The identity is not associated with the current_user so lets 
        # associate the identity
        @github_token.user = current_user
        @github_token.save
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @github_token.user.present?
        # The identity we found had a user associated with it so let's 
        # just log them in here
        self.current_user = @github_token.user
        redirect_to root_url, notice: "Signed in!"
      else
        # No user associated with the identity so we need to create a new one
        redirect_to new_user_url, notice: "Please finish registering"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end

end

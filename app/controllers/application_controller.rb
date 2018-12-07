class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :find_bookmark
  helper_method :list_tags
  helper_method :tutorial_name

  add_flash_types :success
  
  def find_bookmark(id)
    current_user.user_videos.find_by(video_id: id)
  end
  
  def tutorial_name(id)
    Tutorial.find(id).title
  end
  
  def four_oh_four
    raise ActionController::RoutingError.new('Not Found')
  end
  
  protected
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    session[:user_id] = user&.id
    @current_user = user
  end
end

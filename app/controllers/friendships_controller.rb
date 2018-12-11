class FriendshipsController < ApplicationController

  def create
    gh_user = GhUser.find_by(gh_id: params[:id])
    if gh_user.nil?
      flash[:error] = 'Invalid user id.'
      redirect_to '/dashboard'
    elsif gh_user.gh_id
      @friendships = current_user.gh_user.friendships.create(friend_id: gh_user.id)
      redirect_to '/dashboard'
    end
  end
end
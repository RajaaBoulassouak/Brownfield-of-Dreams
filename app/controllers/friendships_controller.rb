class FriendshipsController < ApplicationController

  def create
    gh_user = GhUser.find_by(gh_id: params[:gh_user_id])
    @friendships = current_user.gh_user.friendships.build(friend_id: gh_user.id)
    @friendships.save
    redirect_to '/dashboard'
  end
end
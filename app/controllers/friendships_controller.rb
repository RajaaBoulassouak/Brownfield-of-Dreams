class FriendshipsController < ApplicationController

  def index
    redirect_to dashboard_path
  end
  

  def create
    #add_friend
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Added as friend.'
      redirect_to back
    else
      flash[:error] = 'Unable to add as friend.'
      redirect_to dashboard_path
    end
  end

  def destroy
    #remove_friend
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Removed as friend.'
    redirect_to dashboard_path
  end
end
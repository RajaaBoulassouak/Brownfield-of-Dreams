class WelcomeController < ApplicationController
  def index
    if params[:tag] && current_user
      @tutorials = Tutorial.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
    elsif current_user
      @tutorials = Tutorial.all.paginate(:page => params[:page], :per_page => 5)
    # TODO: Test to see if this statement is actually needed or if it's covered by the else statement
    # elsif params[:tag]
    #   @tutorials = Tutorial.not_classroom_content.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 5)
    else
      @tutorials = Tutorial.not_classroom_content.paginate(:page => params[:page], :per_page => 5)
    end
  end
end

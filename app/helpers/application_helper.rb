module ApplicationHelper
  
  def gh_user?(user)
    GhUser.find_by(gh_id: user.gh_id)
  end
end
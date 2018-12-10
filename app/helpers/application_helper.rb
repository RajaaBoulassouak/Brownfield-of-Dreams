module ApplicationHelper
  def github_connected?(follower)
    GithubToken.find_by(gh_user_id: follower.id)
  end
end

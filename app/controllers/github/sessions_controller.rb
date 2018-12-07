class Github::SessionsController < ApplicationController
  
  def create
    response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV['GITHUB_CLIENT_ID']}&client_secret=#{ENV['GITHUB_CLIENT_SECRET']}&code=#{params[:code]}")
    pairs = response.body.split("&")
    response_hash = {}
    pairs.each do |pair|
      key, value = pair.split("=")
      response_hash[key] = value
    end
    token = response_hash["access_token"]
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(oauth_response.body)
    github_token  = GithubToken.find_or_create_by(user_id: current_user.id)
    github_token.user_id = current_user.id
    github_token.token = token
    github_token.save!
  
    redirect_to '/dashboard'
  end
end
class FollowedUser
  attr_reader :name, :link, :gh_id
  
  def initialize(data)
    @name  = data[:login]
    @link  = data[:html_url]
    @gh_id = data[:id]
  end
end
class GithubMember
  attr_reader :name, :link, :gh_id, :email
  
  def initialize(data)
    @name  = data[:login]
    @link  = data[:html_url]
    @gh_id = data[:id]
    @email = data[:email]
  end
end
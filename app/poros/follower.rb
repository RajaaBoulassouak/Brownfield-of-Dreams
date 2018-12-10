class Follower

  attr_reader :name, :link, :id
  
  def initialize(data)
    @name = data[:login]
    @link = data[:html_url]
    @id = data[:id]
  end
end
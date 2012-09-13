class Song
  
  attr_reader :name, :performer, :url
  
  def initialize(name, performer, url)
    @name = name
    @performer = performer
    @url = url
  end
  
end
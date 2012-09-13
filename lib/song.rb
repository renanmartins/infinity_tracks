class Song
  
  attr_reader :name, :performer, :url
  
  def initialize(name, performer, url)
    @name = name
    @performer = performer
    @url = url
  end
  
  def save 
    system("curl #{url} >> '#{performer}_#{name}.#{extension}'")
  end
  
  private
  
  def extension
    @url.split(".").last
  end
  
end
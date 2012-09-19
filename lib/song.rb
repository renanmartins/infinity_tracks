class Song
  
  attr_reader :name, :performer, :url
  
  def initialize(name, performer, url)
    @name = name
    @performer = performer
    @url = url
    @last_on_set = false
  end
  
  def save directory
    Dir.mkdir(Dir.pwd + "/#{directory}/") unless Dir.exists?(Dir.pwd + "/#{directory}/")
    system("curl #{url} >> \"#{directory}/#{performer}_#{name}.#{extension}\"")
  end
  
  def info
    {:name => @name, :performer => @performer, :url => @url}
  end
  
  def is_last_on_set?
    @last_on_set
  end
  
  def is_last_on_set
    @last_on_set = true
  end
  
  private
  
  def extension
    @url.split(".").last
  end
  
end
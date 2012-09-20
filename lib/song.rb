class Song
  
  attr_reader :name, :performer, :url
  
  def initialize(name, performer, url)
    @name = name
    @performer = performer
    @url = url
    @last_on_set = false
  end
  
  def save mix_name
    directory = sanitize mix_name
    Dir.mkdir(Dir.pwd + "/#{directory}/") unless Dir.exists?(Dir.pwd + "/#{directory}/")
    system("wget -O \"#{directory}/#{sanitize performer}_#{sanitize name}.mp3\" #{url}")
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
  
  def sanitize string
    string.gsub(/[^a-zA-Z0-9_ ]+/, "")
  end
  
end
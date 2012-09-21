class Song
  
  attr_reader :name, :performer, :url
  attr_accessor :metadata
  
  def initialize(name, performer, url)
    @name = name
    @performer = performer
    @url = url
    @last_on_set = false
  end
  
  def save directory
    print "#{performer} - #{name}"
    system("wget -q -O \"#{directory}/#{filename}\" #{url}")
    puts " - done!"
  end
  
  def info
    {:name => @name, :performer => @performer, :url => @url}
  end
  
  def last_on_set?
    @last_on_set
  end
  
  def last_on_set!
    @last_on_set = true
  end
  
  def filename
    "#{Sanitizer.sanitize performer}_#{Sanitizer.sanitize name}.#{extension}" 
  end
  
  def extension
    @url.split(".").last == "m4a" ? "m4a" : "mp3"
  end
  
end
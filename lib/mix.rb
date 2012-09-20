class Mix
  attr_reader :songs, :name
  attr_accessor :similar

  def initialize name
    @name = name
    @songs = []
  end

  def add song
    @songs << song
  end
  
  def save
    directory = Sanitizer.sanitize @name
    Dir.mkdir(Dir.pwd + "/#{directory}/") unless Dir.exists?(Dir.pwd + "/#{directory}/")
    @songs.each {|song| song.save directory}
  end
  
end
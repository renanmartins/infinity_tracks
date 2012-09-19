class Mix
  attr_reader :songs

  def initialize
    @songs = []
  end

  def add song
    @songs << song
  end
  
  def save directory
    @songs.each {|song| song.save directory}
  end
  
end
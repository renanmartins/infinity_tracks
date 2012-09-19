class Mix
  attr_reader :songs, :name

  def initialize name
    @name = name
    @songs = []
  end

  def add song
    @songs << song
  end
  
  def save
    @songs.each {|song| song.save @name}
  end
  
end
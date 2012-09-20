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
    @songs.each {|song| song.save @name}
  end
  
end
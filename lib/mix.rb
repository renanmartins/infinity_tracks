class Mix
  attr_reader :songs, :name, :url
  attr_accessor :similar, :cover_url

  def initialize name, url
    @name = name
    @url = url
    @songs = []
  end

  def add song
    @songs << song
  end
  
  def save    
    directory = Sanitizer.sanitize @name
    create_directory_if_needed directory
    save_playlist directory
    @songs.each {|song| song.save directory}
  end
  
  def playlist
    @songs.collect {|song| song.filename}
  end

  private
  
  def create_directory_if_needed directory
    directory_full_path = Dir.pwd + "/#{directory}/"
    Dir.mkdir(directory_full_path) unless Dir.exists?(directory_full_path)
  end

  def save_playlist directory
    directory_full_path = Dir.pwd + "/#{directory}/"    
    playlist_file = File.open("#{directory_full_path}/#{directory}.m3u", "w+")
    playlist.each {|song_name| playlist_file.puts(song_name)} 
    playlist_file.close

    `curl #{@cover_url} >> "#{directory}/#{Sanitizer.sanitize(name)}.jpg"`
  end
  
end
class SongsProvider
  
  def initialize client, response_parser
    @client = client
    @parser = response_parser
  end
  
  def songs_for_playlist url
    play_token = @parser.play_token(@client.play_token)
    mix_id = @parser.mix_id(@client.playlist url)
    
    begin
      songs = []
      while true
         songs << @parser.song(@client.next play_token, mix_id)
      end
    rescue
      puts "Bad boy. Playlist ended and you controlled flow with exception :("
    end
    
    songs
  end
  
end
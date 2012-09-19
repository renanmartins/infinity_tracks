class MixProvider
  
  def initialize client, response_parser
    @client = client
    @parser = response_parser
  end
  
  def mix url
    play_token = @parser.play_token(@client.play_token)
    mix_id = @parser.mix_id(@client.playlist url)
    
    begin
      mix = Mix.new
      while true
         mix.add @parser.song(@client.next play_token, mix_id)
      end
    rescue
      puts "Bad boy. Playlist ended and you controlled flow with exception :("
    end
    
    mix
  end
  
end
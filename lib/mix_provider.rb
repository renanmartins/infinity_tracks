class MixProvider
  
  def initialize client, response_parser
    @client = client
    @parser = response_parser
  end
  
  def mix url
    play_token = @parser.play_token(@client.play_token)
    mix_id = @parser.mix_id(@client.playlist url)
    
    mix = Mix.new
    
    while true
      song = @parser.song(@client.next play_token, mix_id)
      mix.add song
      break if song.is_last_on_set?
    end
    
    mix
  end
  
end
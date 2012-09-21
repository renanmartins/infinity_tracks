class MixProvider
  
  def initialize client, response_parser
    @client = client
    @parser = response_parser
  end
  
  def mix url
    play_token = @parser.play_token(@client.play_token)
    playlist = @client.playlist url
    mix_id = @parser.mix_id(playlist)
  
    mix = Mix.new @parser.mix_name(playlist), url
    mix.similar = @parser.next_mix_url(@client.similar_mix play_token, mix_id)
    mix.cover_url = @parser.mix_cover_url(playlist)
    
    while true
      song = @parser.song(@client.next play_token, mix_id)
      mix.add song
      break if song.last_on_set?
    end
    
    mix
  end
  
end
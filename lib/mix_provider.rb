class MixProvider
  
  def initialize client, response_parser
    @client = client
    @parser = response_parser
  end
  
  def mix url
    play_token = @parser.play_token(@client.play_token)
    playlist = @client.playlist url
    
    puts "Starting to download #{url}"
    
    mix_id = @parser.mix_id(playlist)
  
    mix_name = @parser.mix_name(playlist)
    mix = Mix.new mix_name, url
    
    puts "Mix name is #{mix_name}"
    
    mix.similar = @parser.next_mix_url(@client.similar_mix play_token, mix_id)
    mix.cover_url = @parser.mix_cover_url(playlist)
    
    puts "Getting songs data"
    while true
      song = @parser.song(@client.next play_token, mix_id)
      mix.add song
      print "."
      break if song.last_on_set?
    end
    
    mix
  end
  
end
class Downloader

  def initialize(url)
    @url = url
    @client = Client.new
    @parser = ResponseParser.new
  end

  def run
    play_token = @parser.play_token(@client.play_token)
    mix_id = @parser.mix_id(@client.playlist @url)
    @parser.song(@client.play play_token, mix_id).save
    while true
       
       @parser.song(@client.next play_token, mix_id).save
      
    end
  end
  
end
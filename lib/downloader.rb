class Downloader

  def initialize(url)
    @url = url
    @client = Client.new
    @parser = ResponseParser.new
  end

  def run
    play_token = @parser.play_token(@client.play_token)
    mix_id = @parser.mix_id(@client.playlist @url)
    song = @parser.song(@client.play play_token, mix_id)
    song.save
  end
  
end
class Client
  
  attr_reader :play_token
  
  def initialize
    @api_key = "e098e014125339698e741cb25feebd9f54b1a89b"
  end
  
  def api_header
    "--header \"X-Api-Key: #{@api_key}\""
  end
  
  def play_token
    `curl #{api_header} http://8tracks.com/sets/new.json`
  end
  
  def playlist url
   `curl #{url}`  
  end
  
  def play play_token, mix_id
    `curl #{api_header} http://8tracks.com/sets/#{play_token}/play.json?mix_id=#{mix_id}` 
  end
  
  def next play_token, mix_id
    `curl #{api_header} http://8tracks.com/sets/#{play_token}/next.json?mix_id=#{mix_id}`    
  end
  
end
class Client
  
  attr_reader :play_token, :api_key
  
  def initialize
    @api_key = "e098e014125339698e741cb25feebd9f54b1a89b"
  end
  
  def api_header
    "--header \"X-Api-Key: #{@api_key}\""
  end
  
  def play_token
    `curl -s #{api_header} http://8tracks.com/sets/new.json`
  end
  
  def playlist url
   `curl -s #{url}`  
  end
  
  def next play_token, mix_id
    `curl -s #{api_header} http://8tracks.com/sets/#{play_token}/next.json?mix_id=#{mix_id}`    
  end
  
  def similar_mix play_token, mix_id
    `curl -s #{api_header} http://8tracks.com/sets/#{play_token}/next_mix.json?mix_id=#{mix_id}`
  end
  
  def popular_playlists number_of_playlists
    `curl -s #{api_header} \"http://8tracks.com/mixes.json?sort=popular&per_page=#{number_of_playlists}\"`
  end
  
end
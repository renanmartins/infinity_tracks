class Client
  
  attr_reader :play_token
  
  def initialize
    @api_key = "75b354efe5198149e4a244130148bcc235efdc47"
  end
  
  def api_header
    "--header \"X-Api-Key: #{@api_key}\""
  end
  
  def play_token
    system("curl #{api_header} http://8tracks.com/sets/new.json")
  end
  
  def playlist url
   system("curl #{url}")    
  end
  
  def play play_token, mix_id
    system("curl #{api_header} http://8tracks.com/sets/#{play_token}/play.json?mix_id=#{mix_id}")    
  end
  
  def next play_token, mix_id
    system("curl #{api_header} http://8tracks.com/sets/#{play_token}/next.json?mix_id=#{mix_id}")    
  end
  
end
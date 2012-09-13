require "JSON"  

class ResponseParser
    
  def play_token json 
    JSON.parse(json)["play_token"]
  end
  
  def mix_id html
    html.match(/mix_id="([\d]+)"/)[1]
  end
  
  def song_url json
    JSON.parse(json)["set"]["track"]["url"]
  end
  
end
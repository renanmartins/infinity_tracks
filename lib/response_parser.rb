require "JSON"  

class ResponseParser
    
  def play_token json 
    JSON.parse(json)["play_token"]
  end
  
  def mix_id html
    html.match(/mix_id="([\d]+)"/)[1]
  end
  
  def song json
    set = JSON.parse(json)["set"]
    track = set["track"]
    song = Song.new track["name"], track["performer"], track["url"]
    song.is_last_on_set if set["at_last_track"]
    song
  end
  
end
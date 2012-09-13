require "JSON"  

class ResponseParser
    
  def play_token json 
    JSON.parse(json)["play_token"]
  end
  
  def mix_id html
    html.match(/mix_id="([\d]+)"/)[1]
  end
  
  def song json
    puts "----------SONG----------\n#{json}\n\n\n"
    track = JSON.parse(json)["set"]["track"]
    Song.new track["name"], track["performer"], track["url"]
  end
  
end
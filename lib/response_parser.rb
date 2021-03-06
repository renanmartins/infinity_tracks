require "json"  
require "htmlentities"

class ResponseParser
    
  def play_token json 
    JSON.parse(json)["play_token"]
  end
  
  def mix_id html
    html.match(/mix_id="([\d]+)"/)[1]
  end
  
  def mix_name html
    HTMLEntities.new.decode(html.match(/<meta content="(.*)" property="og:title" \/>/)[1])
  end

  def mix_cover_url html
    HTMLEntities.new.decode(html.match(/<meta content="(.*)" property="og:image" \/>/)[1])
  end
  
  def song json
    set = JSON.parse(json)["set"]
    track = set["track"]
    song = Song.new track["name"], track["performer"], track["url"]
    song.metadata = track
    song.last_on_set! if set["at_last_track"]
    song
  end
  
  def next_mix_url json
    next_mix_path = JSON.parse(json)["next_mix"]["path"]
    "http://8tracks.com" + next_mix_path
  end
  
  def popular_playlists json
    mixes = JSON.parse(json)["mixes"]
    
    mixes.collect {|m| "http://8tracks.com" + m["path"]}
  end
  
end
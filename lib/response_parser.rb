require "JSON"  

class ResponseParser
  
  def initialize client
    @client = client
  end
  
  def play_token
    @play_token ||= JSON.parse(@client.play_token)["play_token"]
  end
  
  def mix_id url
    html = @client.playlist url
    html.match(/mix_id="([\d]+)"/)[1]
  end
  
end
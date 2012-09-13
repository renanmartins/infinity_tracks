require "JSON"  

class ResponseParser
  
  def initialize(client)
    @client = client
  end
  
  def play_token
    @play_token ||= JSON.parse(@client.get_play_token)["play_token"]
  end
  
end
require 'sinatra'
require 'json'
require 'require_all'
require_all 'lib'

get '/form' do  
  erb :form  
end

get '/' do
  playlist_songs
end

post '/form' do  
  playlist_songs
end

def playlist_songs
  url = params[:url]
  client = Client.new
  parser = ResponseParser.new
  
  play_token = parser.play_token(client.play_token)
  mix_id = parser.mix_id(client.playlist url)
  
  begin
    songs = []
    while true
      songs << parser.song(client.next play_token, mix_id).info
    end
  rescue
    puts "error"
  end
  
  content_type :json
  songs.to_json
end
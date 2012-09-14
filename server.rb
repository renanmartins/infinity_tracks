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
  songs = []
  SongsProvider.new(Client.new, ResponseParser.new).songs_for_playlist(params[:url]).each {|song| songs << song.info}
  
  content_type :json
  songs.to_json
end
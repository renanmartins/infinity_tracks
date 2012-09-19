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
  MixProvider.new(Client.new, ResponseParser.new).mix(params[:url]).songs.each {|song| songs << song.info}
  
  content_type :json
  JSON.pretty_generate(songs)
end
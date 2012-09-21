require 'require_all'
require_all 'lib'

client = Client.new
parser = ResponseParser.new
mix_provider = MixProvider.new(client, parser)

number_of_mixes_to_download = ARGV[0] || 1

mixes = parser.popular_playlists(client.popular_playlists number_of_mixes_to_download)

file = File.open("renanzinho.txt", "w")
mixes.each {|m| mix_provider.mix(m).songs.each{|s| file.puts(s.metadata.to_json)}; puts ""}
file.close
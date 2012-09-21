require 'require_all'
require_all 'lib'

client = Client.new
parser = ResponseParser.new
mix_provider = MixProvider.new(client, parser)

number_of_mixes_to_download = ARGV[0] || 1

mixes = parser.popular_playlists(client.popular_playlists(number_of_mixes_to_download))
mixes.each {|m| mix_provider.mix(m).save}
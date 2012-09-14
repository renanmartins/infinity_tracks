require 'require_all'
require_all 'lib'

SongsProvider.new(Client.new, ResponseParser.new).songs_for_playlist(ARGV[0]).each {|song| song.save}

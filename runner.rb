require 'require_all'
require_all 'lib'

MixProvider.new(Client.new, ResponseParser.new).mix(ARGV[0]).save ARGV[1]

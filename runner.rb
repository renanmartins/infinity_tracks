require 'require_all'
require_all 'lib'

mix_provider = MixProvider.new(Client.new, ResponseParser.new)
number_of_mixes_to_download = ARGV[1] || 0

mix = mix_provider.mix(ARGV[0])
mix.save

number_of_mixes_to_download.to_i.times do 
  mix = mix_provider.mix(mix.similar)
  mix.save
end
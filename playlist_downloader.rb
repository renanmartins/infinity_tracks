require 'require_all'
require_all 'lib'

mix_provider = MixProvider.new(Client.new, ResponseParser.new)
number_of_mixes_to_download = ARGV[1] || 0

mixes = []

mix = mix_provider.mix(ARGV[0])
mix.save

number_of_mixes_to_download.to_i.times do 
  mixes << mix
  next_mix_url = mix.similar
  if mixes.find {|m| m.url == next_mix_url}.nil?
    puts ""
    mix = mix_provider.mix(next_mix_url)
    mix.save
  end
end
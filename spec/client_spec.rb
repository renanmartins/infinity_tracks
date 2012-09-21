require 'spec_helper'

describe 'client' do
  
  before :each do
    @client = Client.new
  end
  
  it 'generates the api header' do
    @client.api_header.should eql '--header "X-Api-Key: e098e014125339698e741cb25feebd9f54b1a89b"'
  end
  
  it 'gets play token' do
    @client.should_receive(:`).with("curl -s #{@client.api_header} http://8tracks.com/sets/new.json")
    @client.play_token
  end
  
  it "gets playlist from url" do
    @client.should_receive(:`).with("curl -s http://8tracks.com/sebastienvachon89/pop-diva-s-remixed")
    @client.playlist "http://8tracks.com/sebastienvachon89/pop-diva-s-remixed"
  end
  
  it "gets a next response for a given mix id and play token" do
    play_token = "381093365"
    mix_id = "1002941"
    @client.should_receive(:`).with("curl -s #{@client.api_header} http://8tracks.com/sets/#{play_token}/next.json?mix_id=#{mix_id}")
    @client.next play_token, mix_id
  end
  
  it "gets the next similar mix of a given mix for a given play token" do
    play_token = "381093365"
    mix_id = "1002941"
    @client.should_receive(:`).with("curl -s #{@client.api_header} http://8tracks.com/sets/#{play_token}/next_mix.json?mix_id=#{mix_id}")
    @client.similar_mix play_token, mix_id
  end
  
  it "gets the most popular playlists" do
    number_of_mixes = 3
    @client.should_receive(:`).with("curl -s #{@client.api_header} \"http://8tracks.com/mixes.json?sort=popular&per_page=#{number_of_mixes}\"")
    @client.popular_playlists number_of_mixes
  end

end
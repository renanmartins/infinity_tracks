require 'spec_helper'

describe 'client' do
  
  before :each do
    @client = Client.new
  end
  
  it 'generates the api header' do
    @client.api_header.should eql '--header "X-Api-Key: 75b354efe5198149e4a244130148bcc235efdc47"'
  end
  
  it 'gets play token' do
    @client.should_receive(:`).with("curl #{@client.api_header} http://8tracks.com/sets/new.json")
    @client.play_token
  end
  
  it "gets playlist from url" do
    @client.should_receive(:`).with("curl http://8tracks.com/sebastienvachon89/pop-diva-s-remixed")
    @client.playlist "http://8tracks.com/sebastienvachon89/pop-diva-s-remixed"
  end
  
  it "gets play response for a given mix id and play token" do
    play_token = "381093365"
    mix_id = "1002941"
    @client.should_receive(:`).with("curl #{@client.api_header} http://8tracks.com/sets/#{play_token}/play.json?mix_id=#{mix_id}")
    @client.play play_token, mix_id
  end
  
  it "gets a next response for a given mix id and play token" do
    play_token = "381093365"
    mix_id = "1002941"
    @client.should_receive(:`).with("curl #{@client.api_header} http://8tracks.com/sets/#{play_token}/next.json?mix_id=#{mix_id}")
    @client.next play_token, mix_id
  end
  
end
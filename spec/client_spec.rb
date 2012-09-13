require 'spec_helper'

describe 'client' do
  
  before :each do
    @client = Client.new
  end
  
  it 'should generate the api header' do
    @client.api_header.should eql '--header "X-Api-Key: 75b354efe5198149e4a244130148bcc235efdc47"'
  end
  
  it 'should get play token from api' do
    @client.should_receive("system").with("curl #{@client.api_header} http://8tracks.com/sets/new.xml")
    @client.play_token
  end
  
  it "should get a playlist from api" do
    @client.should_receive("system").with("curl http://8tracks.com/sebastienvachon89/pop-diva-s-remixed")
    @client.playlist "http://8tracks.com/sebastienvachon89/pop-diva-s-remixed"
  end
  
end
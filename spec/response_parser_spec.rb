require "spec_helper"

describe "response_parser" do

  before :each do
    @client = double("client")
    @response_parser = ResponseParser.new @client
  end

  it "lazily gets the play token out of the response" do
    expected_play_token_json = '{"play_token":"500791857","status":"200 OK","errors":null,"notices":null,"api_warning":["You didn\'t pass an API version, defaulting to api_version=2."],"api_version":2}'
    @client.stub(:play_token).and_return(expected_play_token_json)
    @client.should_receive(:play_token).once
    
    @response_parser.play_token.should eql "500791857"
    @response_parser.play_token.should eql "500791857"
  end
  
  it "gets the mix id out of the response" do
    html = File.open(File.dirname(__FILE__) + "/resources/playlist.html").read
    url = "http://8tracks.com/sebastienvachon89/pop-diva-s-remixed"
    @client.stub(:playlist).with(url).and_return(html)
    
    @response_parser.mix_id(url).should eql "915988"
  end
  
end
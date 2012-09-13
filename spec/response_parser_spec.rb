require "spec_helper"

describe "response_parser" do

  before :each do
    @response_parser = ResponseParser.new
  end

  it "parses the play token out of a json" do
    play_token_json = '{"play_token":"500791857","status":"200 OK","errors":null,"notices":null,"api_warning":["You didn\'t pass an API version, defaulting to api_version=2."],"api_version":2}'
    @response_parser.play_token(play_token_json).should eql "500791857"
  end
  
  it "parses the mix id out of a html" do
    html = File.open(File.dirname(__FILE__) + "/resources/playlist.html").read
    @response_parser.mix_id(html).should eql "915988"
  end
  
end
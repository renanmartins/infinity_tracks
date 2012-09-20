require "spec_helper"

describe "response_parser" do

  before :each do
    @response_parser = ResponseParser.new
    @html = File.open(File.dirname(__FILE__) + "/resources/playlist.html").read
  end

  it "parses the play token out of a json" do
    play_token_json = '{"play_token":"500791857","status":"200 OK","errors":null,"notices":null,"api_warning":["You didn\'t pass an API version, defaulting to api_version=2."],"api_version":2}'
    @response_parser.play_token(play_token_json).should eql "500791857"
  end
  
  it "parses the mix id out of a html" do
    @response_parser.mix_id(@html).should eql "915988"
  end
  
  it "parses the mix name from an html" do
    @response_parser.mix_name(@html).should eql "Pop diva's remixed."    
  end
  
  it "parses the mix url from a next mix json" do
    next_mix_json = File.open(File.dirname(__FILE__) + "/resources/next_mix.json").read
    
    expected_mix_url = "http://8tracks.com/mwamba/just-another-fool-for-choptsticks-and-covers-and-baselines-because-it-feels-good"
    @response_parser.next_mix_url(next_mix_json).should eql expected_mix_url
        
  end
    
  it "parses the song out of a json" do
    play_json = File.open(File.dirname(__FILE__) + "/resources/play.json").read
    
    expected_song_url = "http://cft.8tracks.com/tf/035/117/082/mvUG6M.48k.v3.m4a"
    expected_song_name = "Pennies from Heaven"
    expected_song_performer = "Louis Prima"
    
    song = @response_parser.song(play_json)
    
    song.url.should eql expected_song_url
    song.name.should eql expected_song_name
    song.performer.should eql expected_song_performer
    song.is_last_on_set?.should be_true
  end  
end
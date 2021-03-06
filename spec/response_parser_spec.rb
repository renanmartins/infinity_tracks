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

  it "parses the cover url from an html" do
    @response_parser.mix_cover_url(@html).should eql "http://cf0.8tracks.us/mix_covers/000/915/988/65971.sq250.jpg"
  end
  
  it "parses the mix url from a next mix json" do
    next_mix_json = File.open(File.dirname(__FILE__) + "/resources/next_mix.json").read
    
    expected_mix_url = "http://8tracks.com/mwamba/just-another-fool-for-choptsticks-and-covers-and-baselines-because-it-feels-good"
    @response_parser.next_mix_url(next_mix_json).should eql expected_mix_url   
  end
    
  it "parses the song out of a json" do
    play_json = File.open(File.dirname(__FILE__) + "/resources/play.json").read
    metadata = JSON.parse('{
        "id": 9378697,
        "name": "Pennies from Heaven",
        "performer": "Louis Prima",
        "release_name": "Capitol Collectors Series: Louis Prima",
        "year": 1991,
        "url": "http://cft.8tracks.com/tf/035/117/082/mvUG6M.48k.v3.m4a",
        "faved_by_current_user": false,
        "buy_link": "http://click.linksynergy.com/fs-bin/stat?id=1Cx7A22HMKA&offerid=146261&type=3&subid=0&tmpid=1826&RD_PARM1=http%253A%252F%252Fax.search.itunes.apple.com%252FWebObjects%252FMZSearch.woa%252Fwa%252FadvancedSearch%253FallArtistNames%253DLouis%252BPrima%2526completeTitle%253DPennies%252520from%252520Heaven%2526media%253Dmusic",
        "buy_icon": "http://8tracks.com/assets/buy/itunes.png",
        "you_tube_id": null,
        "you_tube_status": "ok",
        "play_duration": 0
      }')
    
    expected_song_url = "http://cft.8tracks.com/tf/035/117/082/mvUG6M.48k.v3.m4a"
    expected_song_name = "Pennies from Heaven"
    expected_song_performer = "Louis Prima"
    
    song = @response_parser.song(play_json)
    
    song.url.should eql expected_song_url
    song.name.should eql expected_song_name
    song.performer.should eql expected_song_performer
    song.last_on_set?.should be_true
    song.metadata.should eql metadata
  end  
  
  it "parses the popular mixes urls from a json" do
    json = File.open(File.dirname(__FILE__) + "/resources/popular_playlists.json").read
    popular_playlists = ["http://8tracks.com/brookeantonio/you-actually-need-to-party-run-to-this", "http://8tracks.com/colorfulducttape/shit-that-s-been-fueling-my-parties", "http://8tracks.com/valeriaj94/the-lucky-ones-1"]
    @response_parser.popular_playlists(json).should eql popular_playlists
  end
end
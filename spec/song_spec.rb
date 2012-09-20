require "spec_helper"

describe "song" do
  
  before :each do
    @song = Song.new "Friday", "Rebeca Black", "www.address.com/ab25sa.mp3"
  end
  
  it "saves itself in a directory" do
    directory = "test_songs"
    @song.should_receive("system").with("wget -O \"#{directory}/#{@song.performer}_#{@song.name}.mp3\" #{@song.url}")
    @song.save directory
  end
  
  it "handles special characters on its name" do
    directory = "test_songs"
    song = Song.new "Gangnam !'\\Style", "Ps#y", "moizesnaoconsegue.com/music.mp3"
    song.should_receive("system").with("wget -O \"#{directory}/Psy_Gangnam Style.mp3\" #{song.url}")
    song.save directory
  end
  
  it "returns its information" do
    expected_info = {:name => @song.name, :performer => @song.performer, :url => @song.url}
    @song.info.should eql expected_info
  end
  
  it "is not the last song by default" do
    @song.last_on_set?.should be_false
  end
  
  it "knows it's the last song on a set" do
    @song.last_on_set!
    @song.last_on_set?.should be_true
  end
  
end
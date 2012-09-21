require "spec_helper"

describe "song" do
  
  before :each do
    @song = Song.new "Friday", "Rebeca Black", "www.address.com/ab25sa.m4a"
  end
  
  it "saves itself as mp3 in a directory" do
    directory = "test_songs"
    a_song = Song.new "Friday", "Rebeca Black", "www.address.com/urlloucadosoundloud/stream.?sadfgsvbsvsfnbhvjhfuyfuyf"
    a_song.should_receive("system").with("wget -q -O \"#{directory}/#{a_song.performer}_#{a_song.name}.mp3\" #{a_song.url}")
    a_song.save directory
  end
  
  it "saves itself as m4a in a directory" do
    directory = "test_songs"
    @song.should_receive("system").with("wget -q -O \"#{directory}/#{@song.performer}_#{@song.name}.m4a\" #{@song.url}")
    @song.save directory
  end
  
  it "handles special characters on its name" do
    directory = "test_songs"
    song = Song.new "Gangnam !'\\Style", "Ps#y", "moizesnaoconsegue.com/music.m4a"
    song.should_receive("system").with("wget -q -O \"#{directory}/Psy_Gangnam Style.m4a\" #{song.url}")
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
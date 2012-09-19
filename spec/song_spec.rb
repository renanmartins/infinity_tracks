require "spec_helper"

describe "song" do
  
  before :each do
    @song = Song.new "Friday", "Rebeca Black", "www.address.com/ab25sa.mp3"
  end
  
  it "saves itself in a directory" do
    directory = "test_songs"
    @song.should_receive("system").with("curl #{@song.url} >> \"#{directory}/#{@song.performer}_#{@song.name}.mp3\"")
    @song.save directory
    `rm -r #{directory}`
  end
  
  it "returns its information" do
    expected_info = {:name => @song.name, :performer => @song.performer, :url => @song.url}
    @song.info.should eql expected_info
  end
  
end
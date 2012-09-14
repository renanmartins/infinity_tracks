require "spec_helper"

describe "song" do
  
  before :each do
    @song = Song.new "Friday", "Rebeca Black", "www.address.com/ab25sa.mp3"
  end
  
  it "saves itself" do
    @song.should_receive("system").with("curl #{@song.url} >> \"#{@song.performer}_#{@song.name}.mp3\"")
    @song.save
  end
  
  it "returns its information" do
    expected_info = {:name => @song.name, :performer => @song.performer, :url => @song.url}
    @song.info.should eql expected_info
  end
  
end
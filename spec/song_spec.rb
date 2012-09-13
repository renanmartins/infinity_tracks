require "spec_helper"

describe "song" do
  
  it "saves itself" do
    song = Song.new "Friday", "Rebeca Black", "www.address.com/ab25sa.mp3"
    song.should_receive("system").with("curl #{song.url} >> \"#{song.performer}_#{song.name}.mp3\"")
    song.save
  end
  
end
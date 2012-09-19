require "spec_helper"

describe "mix" do
  before :each do
    @mix = Mix.new
    
    @first_song = Song.new "We Found Love", "Rihanna", "naoconsegue.com"
    @second_song = Song.new "We Didnt Find Love", "Rihanna", "moises.com"
    
    @mix.add @first_song
    @mix.add @second_song
  end

  it "has songs" do
    @mix.songs.size.should eql 2
  end
  
  it "should save itself in a directory" do
    directory = "yehyeh/"
    @first_song.should_receive(:save).with(directory)
    @second_song.should_receive(:save).with(directory)
    
    @mix.save directory
  end
end
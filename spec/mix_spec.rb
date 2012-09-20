require "spec_helper"

describe "mix" do
  before :each do
    @mix_name = "mix do bolinha"
    @mix = Mix.new @mix_name
    
    @first_song = Song.new "We Found Love", "Rihanna", "naoconsegue.com"
    @second_song = Song.new "We Didnt Find Love", "Rihanna", "moises.com"
    
    @mix.add @first_song
    @mix.add @second_song
  end

  it "has songs" do
    @mix.songs.size.should eql 2
  end
  
  it "should save itself in a directory" do
    @first_song.should_receive(:save).with(@mix_name)
    @second_song.should_receive(:save).with(@mix_name)
    
    @mix.save
  end
  
  it "has a url for a similar mix" do
    a_similar_mix_url = "a_similar_mix_url"
    @mix.similar = a_similar_mix_url
    @mix.similar.should eql a_similar_mix_url
  end
end
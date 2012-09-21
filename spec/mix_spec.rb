require "spec_helper"

describe "mix" do
  before :each do
    @mix_name = "mix_do_bolinha"
    @url = "8tracks.com/mixdobolinha"
    @mix = Mix.new @mix_name, @url

    Mix.any_instance.stub(:puts)
    
    @first_song = Song.new "We Found Love", "Rihanna", "naoconsegue.com"
    @second_song = Song.new "We Didnt Find Love", "Rihanna", "moises.com"
    
    @mix.add @first_song
    @mix.add @second_song
  end

  it "has songs" do
    @mix.songs.size.should eql 2
  end
  
  it "saves itself in a directory" do
    directory_name = @mix.name
    @first_song.should_receive(:save).with(directory_name)
    @second_song.should_receive(:save).with(directory_name)
    @mix.should_receive(:`).with("wget -q -O \"#{directory_name}/#{@mix_name}.jpg\" #{@mix.cover_url}")
    
    @mix.save
    `rm -rf #{directory_name}`
  end
  
  it "saves a playlist when saving itself" do
    directory_name = @mix.name
    
    @mix.playlist.first.should eql @first_song.filename
    @mix.playlist.last.should eql @second_song.filename
  end
  
  it "has a url for a similar mix" do
    a_similar_mix_url = "a_similar_mix_url"
    @mix.similar = a_similar_mix_url
    @mix.similar.should eql a_similar_mix_url
  end
  
  it "has its url" do
    @mix.url.should eql @url
  end

end
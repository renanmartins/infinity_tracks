require "spec_helper"

describe "mix provider" do
  
  before :each do
    @client = double("client")
    @parser = double("response_parser")
    
    @mix_provider = MixProvider.new @client, @parser
  end
  
  it "delegates properly" do
    url = "moises.com"
    token_from_client = "token_from_client"
    token_from_parser = "token_from_parser"
    playlist_from_client = "playlist_from_client"
    mix_id_from_parser = "mix_id_from_parser"
    song_from_client = "song_from_client"
    a_song = "a_song"
    last_song = "last_song"
    
    mix = Mix.new
    mix.add a_song
    
    @client.should_receive(:play_token).and_return(token_from_client)
    @parser.should_receive(:play_token).with(token_from_client).and_return(token_from_parser)
    @client.should_receive(:playlist).with(url).and_return(playlist_from_client)
    @parser.should_receive(:mix_id).with(playlist_from_client).and_return(mix_id_from_parser)
    
    @client.should_receive(:next).exactly(2).with(token_from_parser, mix_id_from_parser).and_return(song_from_client)
    @parser.should_receive(:song).with(song_from_client).and_return(a_song, last_song)
    a_song.should_receive(:is_last_on_set?).and_return(false)
    last_song.should_receive(:is_last_on_set?).and_return(true)
    
    songs = @mix_provider.mix(url).songs
    songs.first.should eql a_song
    songs.last.should eql last_song
    
  end
  
end
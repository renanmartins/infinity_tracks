require 'spec_helper'

describe 'client' do
  
  before :each do
    @client = Client.new
  end
  
  it 'should generate the api header' do
    @client.api_header.should eql '--header "X-Api-Key: 75b354efe5198149e4a244130148bcc235efdc47"'
  end
  
  it 'should generate play token from api' do
    @client.should_receive("system").with("ls")
    @client.generate_play_token
  end
  
end
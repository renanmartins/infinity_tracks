require 'spec_helper'

describe 'client' do
  
  before :each do
    @client = Client.new
  end
  
  it 'should have the correct API key' do
    @client.api_key.should eql "75b354efe5198149e4a244130148bcc235efdc47"
  end
  
end
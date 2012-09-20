require "spec_helper"

describe "sanitizer" do
  it "removes special characters from a string" do
    Sanitizer.sanitize("a#b$c!x9").should eql "abcx9"
  end
end
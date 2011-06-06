require_relative '../../lib/threepio/engines/google'

describe Threepio::Engines::Google do
  it "should work" do
    Threepio::Engines::Google.api_key = ENV["GOOGLE_API_KEY"]
    translation = Threepio::Engines::Google.translate "hello", :to => :es
    translation.should == "hola"
  end
end

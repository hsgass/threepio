require_relative 'spec_helper'

describe Threepio do
  it "should retrieve a translation from Bing" do
    Threepio.bing('hello', 'es').should eql 'Hola'
  end

  it "should retrieve a translation from Google" do
    Threepio.google('hello', 'es').should eql 'hola'
  end
end

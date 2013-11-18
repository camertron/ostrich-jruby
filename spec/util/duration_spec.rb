# encoding: UTF-8

require 'spec_helper'

describe Util::Duration do
  describe "#from_seconds" do
    it "should return a Duration object with the correct length of time" do
      Util::Duration.from_seconds(60).tap do |duration|
        duration.should be_a(com.twitter.util.Duration)
        duration.inNanoseconds.should == 60_000_000_000
      end
    end
  end
end
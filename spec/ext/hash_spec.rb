# encoding: UTF-8

require 'spec_helper'

describe Hash do
  describe "#to_scala" do
    let(:hash) do
      { "a" => "b", "c" => "d" }
    end

    it "should convert the ruby hash into a mutable scala hashmap" do
      hash.to_scala.tap do |hash_map|
        hash_map.should be_a(Java::Scala.collection.mutable::HashMap)
        hash_map.get("a").get.should == "b"
        hash_map.get("c").get.should == "d"
      end
    end
  end
end
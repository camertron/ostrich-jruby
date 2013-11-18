# encoding: UTF-8

require 'spec_helper'

describe Ostrich::Stats do
  let(:stats) { Ostrich::Stats }

  describe "#incr" do
    it "should increment the stat" do
      stats.incr("blarg").should == 1
      stats.incr("blarg", 2).should == 3
      stats.get_counter("blarg").apply.should == 3
    end
  end

  describe "#add_gauge" do
    it "should add a gauge with a block" do
      stats.add_gauge("foobar") { 10.2 }
      stats.get_gauge("foobar").get.should == 10.2
    end
  end

  describe "#add_metric" do
    it "should add a metric" do
      stats.add_metric("teapot", 14.1)
      stats.get_metric("teapot").should be_a(com.twitter.ostrich.stats.Metric)
    end
  end
end
# encoding: UTF-8

require "rspec"
require "ostrich-jruby"
require 'rack/test'
require 'json'
require 'yaml'

RSpec.configure do |config|
  config.mock_with(:rr)

  config.before(:each) do
    Ostrich::Stats.clear_all
  end

  shared_examples "a stats reporter" do
    it "should report basic JVM stats in json format" do
      results = JSON.parse(get_stats(format: :json))
      results["gauges"].should include("jvm_heap_committed")
      results["counters"].should include("jvm_gc_msec")
    end

    # NOTE: the txt format just so happens to be yaml
    it "should report basic JVM stats in txt format" do
      results = YAML.load(get_stats(format: :txt))
      results["gauges"].should include("jvm_heap_committed")
      results["counters"].should include("jvm_gc_msec")
    end

    context "with some statsy things" do
      before(:each) do
        Ostrich::Stats.incr("foo", 2)
        Ostrich::Stats.add_gauge("bar") { 4 + 1 }
      end

      it "should report custom counters and gauges in json format" do
        results = JSON.parse(get_stats(format: :json))
        results["counters"]["foo"].should == 2
        results["gauges"]["bar"].should == 5
      end

      it "should report custom counters and gauges in txt format" do
        results = YAML.load(get_stats(format: :txt))
        results["counters"]["foo"].should == 2
        results["gauges"]["bar"].should == 5
      end
    end
  end
end

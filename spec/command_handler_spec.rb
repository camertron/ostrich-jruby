# encoding: UTF-8

require 'spec_helper'

describe Ostrich::CommandHandler do
  let(:handler) { Ostrich::CommandHandler.new(Ostrich::Stats.collection) }

  describe "#ping" do
    it "should return 'pong'" do
      JSON.parse(handler.ping).should == { "response" => "pong" }
    end
  end

  describe "#stats" do
    def get_stats(params)
      handler.stats({}, params[:format])
    end

    it_behaves_like "a stats reporter"
  end
end
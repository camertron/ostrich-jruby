# encoding: UTF-8

require 'spec_helper'

describe Ostrich::GrapeEndpoint do
  include Rack::Test::Methods

  def app
    Ostrich::GrapeEndpoint
  end

  describe "#stats" do
    def get_stats(params)
      get "stats.#{params[:format]}"
      last_response.body
    end

    it_behaves_like "a stats reporter"
  end
end
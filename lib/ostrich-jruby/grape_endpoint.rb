require 'grape'

module Ostrich
  class GrapeEndpoint < Grape::API

    # let Ostrich handle the formatting for json (just return the string)
    content_type :json, "application/json"
    formatter :json, lambda { |object, env| object }

    default_format :json

    desc "Get stats from ostrich."
    set(:name, "stats")

    get :stats do
      handler = Ostrich::CommandHandler.new(Ostrich::Stats.collection)
      handler.stats(params, params[:format].to_sym)
    end

  end
end

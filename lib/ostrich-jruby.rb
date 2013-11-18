module Ostrich
  autoload :Stats,          "ostrich-jruby/stats"
  autoload :CommandHandler, "ostrich-jruby/command_handler"
  autoload :GrapeEndpoint,  "ostrich-jruby/grape_endpoint"
end

require "java"
require "ostrich-jruby/util"

require "ostrich-jruby/ext/hash"
require "ostrich-jruby/scala/functions"
require "ostrich-jruby/scala/kernel"

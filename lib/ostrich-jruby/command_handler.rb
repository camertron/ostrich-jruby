# https://github.com/twitter/ostrich/blob/master/src/main/scala/com/twitter/ostrich/admin/CommandHandler.scala
module Ostrich
	class CommandHandler

		attr_reader :handler

		DEFAULT_MIN_DURATION = Util::Duration.from_seconds(60)

		def initialize(stats_collection, min_period = DEFAULT_MIN_DURATION)
			@handler = handler_class.new(nil, stats_collection, min_period)
		end

		%w(ping stats).each do |command|
			define_method(command.to_sym) do |parameters = {}, format = :json|
				execute(command.to_s, parameters, format)
			end
		end

		private

		def execute(command, parameters, format)
			handler.apply(command, parameters.to_scala, format_obj_for(format))
		end

		def handler_class
			com.twitter.ostrich.admin.CommandHandler
		end

		def format_obj_for(symbol)
			java_sym = case symbol
				when :txt then :PlainText
				when :json then :Json
				else
					raise "Invalid format"
			end

			companion(com.twitter.ostrich.admin, :Format, java_sym)
		end

	end
end
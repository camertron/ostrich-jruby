# https://github.com/twitter/util/blob/master/util-core/src/main/scala/com/twitter/util/Duration.scala
module Util
	class Duration
		class << self

			def from_seconds(seconds)
				duration.fromSeconds(seconds)
			end

			private

			def duration
				companion(com.twitter.util, :Duration)
			end

		end
	end
end
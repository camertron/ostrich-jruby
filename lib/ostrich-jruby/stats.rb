# https://github.com/twitter/ostrich/blob/master/src/main/scala/com/twitter/ostrich/stats/Stats.scala
# https://github.com/twitter/ostrich/blob/master/src/main/scala/com/twitter/ostrich/stats/StatsCollection.scala
# https://github.com/twitter/ostrich/blob/master/src/main/scala/com/twitter/ostrich/stats/StatsProvider.scala
module Ostrich
  class Stats
    class << self

      def incr(name, amount = 1)
        collection.incr(name, amount)
      end

      def get_counter(name)
        collection.getCounter(name)
      end

      def add_gauge(name, &block)
        proc = Scala::Function0.new(block)
        collection.addGauge(name, proc)
      end

      def get_gauge(name)
        collection.getGauge(name)
      end

      def add_metric(name, value)
        collection.addMetric(name, value)
      end

      def get_metric(name)
        collection.getMetric(name)
      end

      def clear_all
        collection.clearAll
      end

      def collection
        companion(com.twitter.ostrich.stats, :Stats)
      end

    end
  end
end
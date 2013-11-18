class Hash
  def to_scala
    Java::Scala.collection.mutable::HashMap.new.tap do |map|
      each_pair do |key, val|
        map.put(key, val)
      end
    end
  end
end
module Scala
	class Function
		attr_reader :proc

	  def initialize(proc)
	    @proc = proc
	  end

	  def method_missing(method, *args, &block)
	  	# This is necessary for Scala's "specialization" feature,
	  	# which will call `apply$mcD$sp` if it wants a double, for example.
	  	if method.to_s =~ /\Aapply/
	    	proc.call(*args, &block)
	    end
	  end
	end

	class Function0 < Function
		include Java::Scala.Function0
	end
end

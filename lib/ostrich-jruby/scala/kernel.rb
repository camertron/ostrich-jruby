module Kernel
	def companion(klass, *names)
		singleton = klass.const_get(:"#{names.join("$")}$")
		field = singleton.java_class.field(:"MODULE$")
		field.value(singleton)
	end
end
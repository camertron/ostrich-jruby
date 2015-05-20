# encoding: UTF-8

$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'ostrich-jruby/version'

Gem::Specification.new do |s|
  s.name     = "ostrich-jruby"
  s.version  = ::Ostrich::VERSION
  s.authors  = ["Cameron Dutro"]
  s.email    = ["cdutro@twitter.com"]
  s.homepage = ""

  s.description = s.summary = "Ruby wrapper around the stats collector & reporter for Scala servers"

  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true

  s.requirements << "jar 'com.twitter:ostrich', '~> 9.2.0'"
  s.require_path = 'lib'

  s.files = Dir["{lib,spec}/**/*", "Gemfile", "History.txt", "LICENSE", "README.md", "Rakefile", "ostrich-jruby.gemspec"]
end

source "http://gems.local.twitter.com"

group :development, :test do
  gem "pry-nav"
  gem "jbundler"

	# necessary for development because jbundler
	# doesn't bootstrap our environment properly
  load 'ostrich-jruby.gemspec'

  require 'jbundler/classpath_file'
  JBundler::ClasspathFile.new.require_classpath

	require 'ostrich-jruby'
end

group :test do
  gem 'rspec', '~> 2.11.0'
  gem 'rr',    '~> 1.0.4'
  gem 'grape', '= 0.6.0'  # gem collision with jbundler (virtus) if looser
  gem 'json'
  gem 'rack-test'
end
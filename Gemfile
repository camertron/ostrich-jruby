source "http://gems.local.twitter.com"

group :development, :test do
  gem "rake"
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
  gem 'grape', '~> 0.11.0'
  gem 'json'
  gem 'rack-test'
end

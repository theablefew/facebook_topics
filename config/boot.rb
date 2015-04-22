require 'rubygems'
 
APP_PATH ||= File.expand_path('../..', __FILE__)
RACK_ENV ||= ENV['RACK_ENV'] || 'development'
# Set up gems listed in the Gemfile.
gemfile = File.expand_path('../../Gemfile', __FILE__)
begin
  ENV['BUNDLE_GEMFILE'] = gemfile
  require 'bundler'
  Bundler.setup
  Bundler.require(:default)

  Dir["#{File.expand_path('../../lib',  __FILE__)}/**/*.rb"].each { |f|  require f }
rescue Bundler::GemNotFound => e

  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)



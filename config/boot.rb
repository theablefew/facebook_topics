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

  #db_config = YAML::load(File.open(File.join(APP_PATH,'config','database.yml')))[RACK_ENV]
  #ActiveRecord::Base.establish_connection(db_config)
  
  # require File.expand_path('../../lib/ohm/model.rb', __FILE__)
  #Dir["#{File.expand_path('../../lib/ohm',  __FILE__)}/*.rb"].each { |f|  require f }
  Dir["#{File.expand_path('../../lib',  __FILE__)}/**/*.rb"].each { |f|  require f }
  #Dir["#{File.expand_path('../lib',  __FILE__)}/facebook_topics/*.rb"].each { |f|  require f }

  #require File.expand_path("../environments/#{RACK_ENV}",  __FILE__)
  #
rescue Bundler::GemNotFound => e

  STDERR.puts e.message
  STDERR.puts "Try running `bundle install`."
  exit!
end if File.exist?(gemfile)



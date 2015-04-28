# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler/version'

Gem::Specification.new do |s|
  s.name        = "facebook_topics"
  s.version     = "1.1.2"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Spencer Markowski"]
  s.email       = ["spencer@theablefew.com"]
  s.homepage    = "http://github.com/theablefew/facebook_topics"
  s.summary     = "Wrapper for Facebook Topic APIs"
  s.description = "Search Facebook topics and retrieve feeds related to those topics."

  s.required_rubygems_version = ">= 1.3.6"
  s.add_runtime_dependency 'rainbow', '~> 2.0'
  s.add_runtime_dependency 'hashie', '~> 3.4'
  s.add_runtime_dependency 'httparty', '~> 0.11'
  #s.rubyforge_project         = "bundler"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  #s.executables  = ['bundle']
  s.require_path = 'lib'
end

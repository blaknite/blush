$:.push File.expand_path("../lib", __FILE__)

require "blush/version"

Gem::Specification.new do |s|
  s.name        = 'blush'
  s.version     = Blush::VERSION
  s.date        = '2016-05-16'
  s.authors     = ["Grant Colegate"]
  s.email       = ["blaknite@thelanbox.com.au"]
  s.homepage    = ""
  s.summary     = "View Models for Rails"
  s.description = "View Models for Rails"

  s.files = Dir["lib/**/*", "LICENSE", "README.md"]

  s.add_dependency "rails"
end

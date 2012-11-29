# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack-ermahgerd/version'

Gem::Specification.new do |gem|
  gem.name          = "rack-ermahgerd"
  gem.version       = Rack::Ermahgerd::VERSION
  gem.authors       = ["Daniel Westendorf"]
  gem.email         = ["daniel@prowestech.com"]
  gem.description   = "Rack::Ermahgerd is a simple Rack middleware that translates the content of a web page into Ermahgerd-ish"
  gem.summary       = "Translate your web content with the ermahgerd gem"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'nokogiri'
  
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "test-unit"
  gem.add_development_dependency "shoulda"
  gem.add_development_dependency "rack"
  gem.add_development_dependency "rack-test"
end

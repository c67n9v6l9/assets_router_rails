# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'assets_router_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "assets_router_rails"
  spec.version       = AssetsRouterRails::VERSION
  spec.authors       = ["c67n9v6l9"]
  spec.email         = ["c67n9v6l9@gmail.com"]
  spec.summary       = %q{assets router generator for rails.}
  spec.description   = %q{assets router generator for rails. please read README.md}
  spec.homepage      = "http://c67n9v6l9.hatenablog.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'jquery-rails', '~> 0'
  spec.add_development_dependency 'sass-rails', '~> 5.0'
  spec.add_development_dependency 'coffee-rails', '~> 4.1', '>= 4.1.0'
  spec.add_development_dependency 'compass-rails', '~> 2.0', '>= 2.0.4'
  spec.add_development_dependency 'underscore-rails', '~> 0'
  spec.add_development_dependency 'rails_config', '~> 0'
end

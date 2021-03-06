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

  spec.add_dependency 'compass-rails'
  spec.add_dependency 'underscore-rails'
  spec.add_dependency 'jquery-easing-rails'
end

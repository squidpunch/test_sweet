# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'test_sweet/version'

Gem::Specification.new do |spec|
  spec.name          = "test_sweet"
  spec.version       = TestSweet::VERSION
  spec.authors       = ["David Larrabee"]
  spec.email         = ["david.larrabee@meyouhealth.com"]
  spec.description   = %q{Integration testing your rubymotion applications the simple and sweet way.}
  spec.summary       = %q{Integration testing your rubymotion applications the simple and sweet way.}
  spec.homepage      = "https://github.com/squidpunch/test_sweet"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "appium_lib", ">= 7.0"
  spec.add_dependency "motion-juxtapose", ">= 0.3"
  spec.add_dependency "cucumber", ">= 2.0"
  spec.add_dependency "rspec", ">= 3.3.0"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

# -*- encoding: utf-8 -*-
VERSION = "1.0"

Gem::Specification.new do |spec|
  spec.name          = "test_sweet"
  spec.version       = VERSION
  spec.authors       = ["David Larrabee"]
  spec.email         = ["david.larrabee@meyouhealth.com"]
  spec.description   = %q{Integration testing your rubymotion applications the simple and sweet way.}
  spec.summary       = %q{Integration testing your rubymotion applications the simple and sweet way.}
  spec.homepage      = "https://github.com/squidpunch/test_sweet"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end

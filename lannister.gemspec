#../lannister_data coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lannister/version'

Gem::Specification.new do |spec|
  spec.name          = "lannister"
  spec.version       = Lannister::VERSION
  spec.authors       = ["Fabiano Beselga"]
  spec.email         = ["fabianobeselga@gmail.com"]
  spec.summary       = %q{ PoC of a simple accounting system using Clean Architecture}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "sqlite3"

  #spec.add_dependency "lannister_data"
  spec.add_dependency "caze", ">= 0.0.3"

  spec.add_dependency "activemodel"
  spec.add_dependency "activesupport"
end

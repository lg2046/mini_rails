# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mini_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "mini_rails"
  spec.version       = MiniRails::VERSION
  spec.authors       = ["lg2046"]
  spec.email         = ["lg2046@gmail.com"]
  spec.description   = %q{mini rails exercise}
  spec.summary       = %q{mini rails exercise}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_runtime_dependency "rack", "~> 1.5.2"
  spec.add_runtime_dependency "activesupport", "~> 3.2.14"
  spec.add_runtime_dependency "erubis", "~> 2.7.0"
end

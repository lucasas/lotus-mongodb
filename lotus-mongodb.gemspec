# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lotus/model/adapters/version'

Gem::Specification.new do |spec|
  spec.name          = "lotus-mongodb"
  spec.version       = Lotus::Model::Adapters::Mongodb::VERSION
  spec.authors       = ["Lucas Souza"]
  spec.email         = ["lucasas@gmail.com"]
  spec.summary       = %q{MongoDB lotus-model adapter}
  spec.homepage      = "http://github.com/lucasas/lotus-mongodb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "lotus-model"
  spec.add_dependency "moped"
end

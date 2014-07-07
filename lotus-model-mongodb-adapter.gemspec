# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lotus/model/mongodb/adapter/version'

Gem::Specification.new do |spec|
  spec.name          = "lotus-model-mongodb-adapter"
  spec.version       = Lotus::Model::Mongodb::Adapter::VERSION
  spec.authors       = ["Lucas Souza"]
  spec.email         = ["lucasas@gmail.com"]
  spec.summary       = %q{MongoDB lotus-model adapter}
  spec.homepage      = "http://githucb.com/lucasas/lotus-model-mongodb-adapter"
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

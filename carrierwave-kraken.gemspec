# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/kraken/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-kraken"
  spec.version       = CarrierWave::Kraken::VERSION
  spec.authors       = ["Mateusz Juraszek"]
  spec.email         = ["mateusz@webtigers.eu"]

  spec.summary       = %q{Enables kraken image optimisation for carrierwave}
  spec.homepage      = "https://github.com/tiramizoo/carrierwave-kraken"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "carrierwave"
  spec.add_development_dependency "kraken-io", "~> 0.1.3"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "mocha", "~> 1.2.1"
  spec.add_development_dependency "vcr", "~> 3.0.3"
end

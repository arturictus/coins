# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coins/version'

Gem::Specification.new do |spec|
  spec.name          = "coins"
  spec.version       = Coins::VERSION
  spec.authors       = ["Artur Pañach"]
  spec.email         = ["arturictus@gmail.com"]
  spec.description   = %q{adds tax calculations to your app}
  spec.summary       = %q{set tax_rate and you'll have methods for your models and helpers for your views}
  spec.homepage      = "https://github.com/arturictus/coins"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

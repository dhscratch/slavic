# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slavic/version'

Gem::Specification.new do |spec|
  spec.name          = "slavic"
  spec.version       = Slavic::VERSION
  spec.authors       = ["Malo Skrylevo"]
  spec.email         = ["majioa@yandex.ru"]
  spec.description   = %q{Slavic gem contains methods for slavic text processing, and other slavic helpful things}
  spec.summary       = %q{Slavic gem contains methods for slavic text processing, etc}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "rake"
end

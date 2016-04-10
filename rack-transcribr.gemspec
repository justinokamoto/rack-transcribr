# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/transcribr/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-transcribr"
  spec.version       = Rack::Transcribr::VERSION
  spec.authors       = ["Justin Okamoto"]
  spec.email         = ["justin@gmail.com"]

  spec.summary       = %q{ This gem is a replacement for Rack's CommonLogger }
  spec.description   = %q{ I'm experimenting with creating Rack middleware gems. This lightweight gem servers as a replacement to Rack's CommonLogger statements. Improvements include colorized terminal output based on HTTP request method. }
  spec.homepage      = "https://github.com/justinokamoto/rack-transcribr.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end

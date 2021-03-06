# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "election_day/version"

Gem::Specification.new do |spec|
  spec.name          = "election_day"
  spec.version       = ElectionDay::VERSION
  spec.authors       = ["Justin Cypret"]
  spec.email         = ["jcypret@gmail.com"]

  spec.summary       = %q{A library to calculate when U.S. Election Day occurs.}
  spec.homepage      = "https://github.com/jcypret/election_day"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "timecop", "~> 0.8.1"
  spec.add_development_dependency "simplecov"
end

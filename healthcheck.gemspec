lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "healthcheck/version"

Gem::Specification.new do |spec|
  spec.name          = "healthcheck"
  spec.version       = Healthcheck::VERSION
  spec.authors       = ["Asfand Qazi", "Lee-Jon Ball"]
  spec.email         = ["ayqazi@gmail.com"]

  spec.summary       = %q{Simple healthcheck Rack middleware; supports Rails OOTB}
  spec.homepage      = "https://github.com/Alliants/healthcheck"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.34.0"
end

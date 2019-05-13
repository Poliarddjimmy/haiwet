
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "haiwet/version"

Gem::Specification.new do |spec|
  spec.name          = "haiwet"
  spec.version       = Haiwet::VERSION
  spec.authors       = ["Poliard Djimmy"]
  spec.email         = ["poliarddjimmy@gmail.com"]

  spec.summary       = %q{My Summary here}
  spec.homepage      = "https://github.com/Poliarddjimmy/haiwet"
  spec.license       = "MIT"

  #spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end

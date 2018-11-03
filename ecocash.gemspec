
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ecocash/version"

Gem::Specification.new do |spec|
  spec.name          = "ecocash"
  spec.version       = Ecocash::VERSION
  spec.authors       = ["tusomx"]
  spec.email         = ["tusomx@gmail.com"]

  spec.summary       = %q{This gem allows you to accept EcoCash mobile payments as a payment method.}
  spec.description   = %q{EcoCash Ruby wrapper}
  spec.homepage      = "https://github.com/tusomx/ecocash"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = "https://github.com/tusomx/ecocash"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

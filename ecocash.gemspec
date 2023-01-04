
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ecocash/version"

Gem::Specification.new do |spec|
  spec.name          = "ecocash"
  spec.version       = Ecocash::VERSION
  spec.authors       = ["Kudzai Tuso"]
  spec.email         = ["tusomx@gmail.com"]

  spec.summary       = %q{Ruby wrapper for EcoCash API}
  spec.description   = %q{EcoCash is the easiest way to accept mobile payments online. See https://ecocash.co.zw for more details.}
  spec.homepage      = "https://github.com/tusomx/ecocash"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", ">= 0.16.2", "< 0.22.0"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13.0"
end

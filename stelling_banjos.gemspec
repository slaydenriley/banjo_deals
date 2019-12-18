
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stelling_banjos/version"

Gem::Specification.new do |spec|
  spec.name          = "stelling_banjos"
  spec.version       = StellingBanjos::VERSION
  spec.authors       = ["'Riley Slayden'"]
  spec.email         = ["'slaydenriley@gmail.com'"]

  spec.summary       = %q{This gem displays banjos for sale on elderly.com and provides the user with additional information.}
  spec.homepage      = "https://github.com/slaydenriley/stelling_banjos"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "pry"
end

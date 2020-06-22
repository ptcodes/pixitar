require_relative 'lib/pixitar/version'

Gem::Specification.new do |spec|
  spec.name          = "pixitar"
  spec.version       = Pixitar::VERSION
  spec.authors       = ["Pavel Timofeev"]
  spec.email         = ["pav.timofeev@gmail.com"]

  spec.summary       = "Avatar generation library"
  spec.description   = "Pixitar generates random pixel avatar"
  spec.homepage      = "https://github.com/ptcodes/pixitar"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.add_runtime_dependency "chunky_png", "~> 1.3.11"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ptcodes/pixitar.git"
  spec.metadata["changelog_uri"] = "https://github.com/ptcodes/pixitar/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

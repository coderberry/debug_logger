# frozen_string_literal: true

require_relative "lib/debug_logger/version"

Gem::Specification.new do |spec|
  spec.name = "debug-logger"
  spec.version = DebugLogger::VERSION
  spec.authors = ["Eric Berry"]
  spec.email = ["eric@berry.sh"]

  spec.summary = "A simple logger for debugging"
  spec.description = "When you need to debug something, but don't want to litter your code with puts statements, use this gem."
  spec.homepage = "https://github.com/coderberry/debug_logger"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "semantic_logger", "~> 4.11.0"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "timecop"
end

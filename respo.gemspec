# frozen_string_literal: true

require_relative 'lib/respo/version'

Gem::Specification.new do |spec|
  spec.name = 'respo'
  spec.version = Respo::VERSION
  spec.authors = ['Miko Dagatan']
  spec.email = ['miguel.dagatan@gmail.com']

  spec.summary = 'A gem that allows easier responses for your API'
  spec.description = 'This gem allows you to call consistent responses, making it easier for you to create your API'
  spec.homepage = 'https://rubygems.org/gems/respo'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/mikodagatan/respo'
  spec.metadata['changelog_uri'] = 'https://github.com/mikodagatan/respo/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_dependency 'blueprinter'
end

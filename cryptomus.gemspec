# frozen_string_literal: true

require_relative 'lib/cryptomus/version'

Gem::Specification.new do |spec|
  spec.name = 'cryptomus'
  spec.version = Cryptomus::VERSION
  spec.authors = ['Denis Talakevich']
  spec.email = ['senid231@gmail.com']

  spec.summary = 'Ruby SDK for Cryptomus Crypto Payment Gateway.'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/senid231/cryptomus-ruby-sdk'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?('bin/', 'spec/', '.git', 'Gemfile', 'Rakefile')
    end
  end
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'faraday', '~> 2.7'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end

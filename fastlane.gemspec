# coding: utf-8

lib = File.expand_path('../fastlane/lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/version'

# Copy over the latest .rubocop.yml style guide
require 'yaml'
rubocop_config = File.expand_path('../.rubocop.yml', __FILE__)
config = YAML.safe_load(open(rubocop_config))
config.delete("require")

Gem::Specification.new do |spec|
  spec.name          = "fastlane"
  spec.version       = Fastlane::VERSION
  # list of authors is regenerated and resorted on each release
  spec.authors       = ["Manu Wallner",
                        "Josh Holtz",
                        "Iulian Onofrei",
                        "Luka Mirosevic",
                        "Danielle Tomlinson",
                        "Joshua Liebowitz",
                        "Jérôme Lacoste",
                        "Fumiya Nakamura",
                        "Aaron Brager",
                        "Felix Krause",
                        "Olivier Halligon",
                        "Matthew Ellis",
                        "Daniel Jankowski",
                        "Maksym Grebenets",
                        "Max Ott",
                        "Kohki Miki",
                        "Jimmy Dee",
                        "Stefan Natchev",
                        "Helmut Januschka",
                        "Andrew McBurney",
                        "Jan Piotrowski",
                        "Jorge Revuelta H"]

  spec.email         = ["fastlane@krausefx.com"]
  spec.summary       = Fastlane::DESCRIPTION
  spec.description   = Fastlane::DESCRIPTION
  spec.homepage      = "https://fastlane.tools"
  spec.license       = "MIT"
  spec.metadata      = {
    "docs_url" => "https://docs.fastlane.tools"
  }

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir.glob("*/lib/**/*", File::FNM_DOTMATCH) + Dir["fastlane/swift/**/*"] + Dir["bin/*"] + Dir["*/README.md"] + %w(README.md LICENSE .yardopts) - Dir["fastlane/lib/fastlane/actions/device_grid/assets/*"] - Dir["fastlane/lib/fastlane/actions/docs/assets/*"]
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = Dir["*/lib"]

  spec.add_dependency('excon', '>= 0.71.0', '< 1.0.0') # Great HTTP Client
  spec.add_dependency('faraday-cookie_jar', '~> 0.0.6')
  spec.add_dependency('faraday', '~> 0.17') # Used for deploygate, hockey and testfairy actions
  spec.add_dependency('faraday_middleware', '~> 0.13.1') # same as faraday
  spec.add_dependency('jwt', '~> 2.1.0') # Used for generating authentication tokens for AppStore connect api
  spec.add_dependency('plist', '>= 3.1.0', '< 4.0.0') # Needed for set_build_number_repository and get_info_plist_value actions
  spec.add_dependency('babosa', '>= 1.0.2', "< 2.0.0")
  spec.add_dependency('fastimage', '>= 2.1.0', '< 3.0.0')
  spec.add_dependency('colored')

  # Development only
  spec.add_development_dependency('rake', '< 12')
  spec.add_development_dependency('rspec', '~> 3.5.0')
  spec.add_development_dependency('rspec_junit_formatter', '~> 0.2.3')
  spec.add_development_dependency('pry')
  spec.add_development_dependency('pry-byebug')
  spec.add_development_dependency('pry-rescue')
  spec.add_development_dependency('pry-stack_explorer')
  spec.add_development_dependency('yard', '~> 0.9.11')
  spec.add_development_dependency('webmock', '~> 2.3.2')
  spec.add_development_dependency('hashdiff', '< 0.4.0') # Locked under 0.4.0 until webmock bumped up to 3.6.0 or greater - HashDiff was changed to Hashdiff
  spec.add_development_dependency('coveralls', '~> 0.8.13')
  spec.add_development_dependency('rubocop', Fastlane::RUBOCOP_REQUIREMENT)
  spec.add_development_dependency('rubocop-require_tools', '>= 0.1.2')
  spec.add_development_dependency('rb-readline') # https://github.com/deivid-rodriguez/byebug/issues/289#issuecomment-251383465
  spec.add_development_dependency('rest-client', '>= 1.8.0')
  spec.add_development_dependency('fakefs', '~> 0.8.1')
  spec.add_development_dependency('sinatra', '~> 1.4.8')
  spec.add_development_dependency('xcov', '~> 1.4.1') # Used for xcov's parameters generation: https://github.com/fastlane/fastlane/pull/12416
  spec.add_development_dependency('climate_control', '~> 0.2.0')
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "provider-testing"

Gem::Specification.new do |s|
  s.name        = "provider-testing"
  s.version     = ProviderTesting::VERSION

  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Klaus Kämpf"]
  s.email       = ["kkaempf@suse.de"]
  s.license     = "Ruby"
  s.homepage    = "https://github.com/kkaempf/providers-testing"
  s.summary     = %q{A testing framework for CIM providers}
  s.description = %q{This framework uses Ruby, Rake and a local
instance of the SFCB CIMOM to run tests against CIM providers}

  s.required_ruby_version = ">= 2.4"

  # Ruby SFCC bindings
  s.add_dependency("sfcc", ["~> 0.10"])

  s.add_development_dependency('rake', ["~> 0"])
  s.add_development_dependency('bundler', ["~> 0"])

  s.files         = [
    "Gemfile",
    "LICENSE",
    "README.md",
    "Rakefile"] + Dir.glob("**/*.rb") + Dir.glob("**/*.rake")

  s.extra_rdoc_files    = Dir['README.md', 'LICENSE']
  s.require_paths = ["lib"]
end

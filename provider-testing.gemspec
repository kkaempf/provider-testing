# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "provider-testing"

Gem::Specification.new do |s|
  s.name        = "provider-testing"
  s.version     = ProviderTesting::VERSION

  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Klaus Kämpf"]
  s.email       = ["kkaempf@suse.de"]
  s.homepage    = "https://github.com/kkaempf/providers-testing"
  s.summary     = %q{A testing framework for CIM providers}
  s.description = %q{This framework uses Ruby, Rake and a local
instance of the SFCB CIMOM to run tests against CIM providers}

  s.rubyforge_project = "provider-testing"

  # Ruby SFCC bindings
  s.add_dependency("sfcc", ["~> 0.6"])

  s.add_development_dependency('rake')
  s.add_development_dependency('bundler')

  s.files         = `git ls-files`.split("\n")
  s.files.reject! { |fn| fn == '.gitignore' }
  s.extra_rdoc_files    = Dir['README*', 'TODO*', 'CHANGELOG*', 'LICENSE']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

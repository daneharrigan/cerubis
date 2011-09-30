# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cerubis/version"

Gem::Specification.new do |s|
  s.name        = "cerubis"
  s.version     = Cerubis::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dane Harrigan"]
  s.email       = ["dane.harrigan@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A simple, secure, non-evaluating template engine}
  s.description = %q{A simple, secure, non-evaluating template engine}

  s.rubyforge_project     = "cerubis"
  s.required_ruby_version = '>= 1.9.2'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

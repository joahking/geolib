# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "geolib/version"

Gem::Specification.new do |s|
  s.name        = "geolib"
  s.version     = Geolib::VERSION
  s.authors     = ["Joaquin Rivera Padron"]
  s.email       = ["joahking@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{a ruby library of geo functions and helpers}
  s.description = %q{collection of ruby helpers to handle geo operations}

  s.rubyforge_project = "geolib"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
end

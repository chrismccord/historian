# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "historian/version"

Gem::Specification.new do |s|
  s.name        = "historian"
  s.version     = Historian::VERSION
  s.authors     = ["Chris McCord"]
  s.email       = ["chris@chrismccord.com"]
  s.homepage    = ""
  s.summary     = %q{Track arbitrary metrics from your application}
  s.description = %q{Historian records a history of arbitrary metrics from your application such as tracking history of cached daily metrics that are otherwise overwritten.}

  s.rubyforge_project = "historian"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency('will_paginate', '~> 3.0.pre2')
  s.add_development_dependency('shoulda', '~> 2.11.3')
  s.add_development_dependency('mocha', '~> 0.9.11')  
end

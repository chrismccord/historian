# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "historian/version"

Gem::Specification.new do |s|
  s.name        = "historian"
  s.version     = Historian::VERSION
  s.authors     = ["Chris McCord"]
  s.email       = ["chris@chrismccord.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "historian"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency('will_paginate', '~> 3.0.pre2')
  
end

# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blog_kit/version"

Gem::Specification.new do |s|
  s.name        = "blog_kit"
  s.version     = BlogKit::VERSION
  s.authors     = ["Arvid Böttiger"]
  s.email       = ["bottiger@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "blog_kit"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency('will_paginate')
  s.add_dependency('paperclip', '~> 2.3')
  s.add_dependency('ruby-openid', '2.1.8')
  s.add_dependency('authlogic-oid', '1.0.4')
  s.add_dependency('activeadmin')
  s.add_dependency('acts-as-taggable-on')

end

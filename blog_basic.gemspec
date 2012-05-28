# -*- encoding: utf-8 -*-
require File.expand_path("../lib/blog_basic/version", __FILE__)
#require "blog_basic/version"

Gem::Specification.new do |s|
  s.name        = "blog_basic"
  s.version     = BlogBasic::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Arvid Böttiger"]
  s.email       = ["bottiger@gmail.com"]
  s.homepage    = "http://bottiger.org/made/blog_basic"
  s.summary     = "Provides a basic blogging platform"
  s.description = "Simply generates lorem ipsum text."


  s.add_dependency("bluecloth", "~> 2.2.0")  
  s.add_dependency("paperclip", ">= 2.3")
  s.add_dependency("sass-rails")
  s.add_dependency("meta_search", "~> 1.1.1")
  s.add_dependency("acts-as-taggable-on", "~> 2.2.0")
  s.add_dependency("omniauth", "~> 1.0.0")
  s.add_dependency("omniauth-openid", "~> 1.0.0")
  s.add_dependency("omniauth-github", "~> 1.0.0")
  s.add_dependency("coderay")
  s.add_dependency("will_paginate", "~> 3.0.3")

  s.add_development_dependency "rspec"

  s.rubyforge_project = "blog_basic"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

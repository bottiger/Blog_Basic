require 'rake'
require "bundler/gem_tasks"
require 'rake/testtask'
#require 'rdoc/task'
#require 'spec'
#require 'spec/rake/spectask'

require 'rubygems'
require 'echoe'

Echoe.new('blog_basic', '0.1.4') do |p|
  p.description    = "Sets up a basic but functional blogging platform."
  p.url            = "http://bottiger.org/made/blog_basic"
  p.author         = "Arvid Boettiger"
  p.email          = "bottiger@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.runtime_dependencies = ['bluecloth ~>2.2.0', 'will_paginate >=3.0.1', "paperclip >=2.3", "activeadmin", "acts-as-taggable-on ~>2.1.1", "omniauth ~>1.0.0", "omniauth-openid ~>1.0.0", "omniauth-github ~>1.0.0"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }


#desc 'Test the blog_kit plugin.'
#Rake::TestTask.new(:test) do |t|
#  t.libs << 'lib'
#  t.libs << 'test'
#  t.pattern = 'test/**/*_test.rb'
#  t.verbose = true
#end

desc 'Generate documentation for the blog_basic plugin.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BlogBasic'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

#desc 'Default: run specs.'
#task :default => :spec

#desc "Run the specs under spec/models"
#Spec::Rake::SpecTask.new do |t|
#  t.spec_opts = ['--options', "spec/spec.opts"]
#  t.spec_files = FileList['spec/*_spec.rb', 'spec/**/*_spec.rb']
#end

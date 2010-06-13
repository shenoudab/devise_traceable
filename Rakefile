# encoding: UTF-8
require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rake/testtask'
require File.join(File.dirname(__FILE__), 'lib', 'devise_traceable', 'version')

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'DeviseTraceable'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

spec = Gem::Specification.new do |s|
  s.name = "devise_traceable"
  s.summary = "Devise Traceable"
  s.description = "Devise Traceable"
  s.files =  FileList["[A-Z]*", "{app,config,lib}/**/*"]
  s.version = DeviseTraceable::VERSION.dup
  s.email = "sbertel@mobithought.com"
  s.homepage = "http://github.com/shenoudab/devise_traceable"
  s.author = 'Shenouda Bertel'
end

Rake::GemPackageTask.new(spec) do |pkg|
end

desc "Install the gem #{spec.name}-#{spec.version}.gem"
task :install do
  system("gem install pkg/#{spec.name}-#{spec.version}.gem --no-ri --no-rdoc")
end

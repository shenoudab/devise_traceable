# encoding: UTF-8
require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rake/testtask'

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
  s.summary = "Devise Traceable For Traceing Devise Models"
  s.description = "Devise Traceable For Traceing Devise Models Logins and Logouts in separate model table"
  s.files =  FileList["[A-Z]*", "{lib}/**/*"]
  s.require_paths = ["lib"]
  s.version = "0.0.1"
  s.email = "sbertel@mobithought.com"
  s.homepage = "http://github.com/shenoudab/devise_traceable"
  s.author = 'Shenouda Bertel'
  s.add_dependency("warden")
  s.add_dependency("devise")
end

Rake::GemPackageTask.new(spec) do |pkg|
end

desc "Install the gem #{spec.name}-#{spec.version}.gem"
task :install do
  system("gem install pkg/#{spec.name}-#{spec.version}.gem --no-ri --no-rdoc")
end
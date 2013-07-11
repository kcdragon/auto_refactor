require 'cucumber/rake/task'
require 'rdoc/task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new

Rake::RDocTask.new do |rd|
  rd.main = "README"
  rd.rdoc_files.include("README", "lib/**/*.rb")
end

task :default => :spec

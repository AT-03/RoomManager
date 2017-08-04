# Cabero

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
end

task :spec do
  Rake::Task[:spec].invoke
end

task(:default).clear

task default: :spec

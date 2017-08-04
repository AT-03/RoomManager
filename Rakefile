
# Daniel Cabero

require 'bundler/gem_tasks'

begin
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
end

task :spec do
  Rake::Task[:spec].invoke
end

task(:default).clear

task default: :spec

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :spec do
  Rake::Task[:spec_prep].invoke
  Rake::Task[:spec_standalone].invoke
  Rake::Task[:spec_clean].invoke
end

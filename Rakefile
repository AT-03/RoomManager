# Author: Daniel Cabero
require 'bundler/gem_tasks'
require 'rubygems'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec'

# Task default for the run in the travis CI.
task :spec do
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
  Rake::Task[:spec].invoke

end

# Task for the generate the report of the all features files.
task :@all do
  Cucumber::Rake::Task.new :all do |t|
    t.profile = 'default'
    sh 'cucumber --format PrettyFace::Formatter::Html --out test_reports/all.html'
  end
end

# Task for the generate the report of the smoke features files.
task(:@smoke) {
  Cucumber::Rake::Task.new :smoke do |t|
    t.profile = 'default'
    sh 'cucumber --tags @smoke --format PrettyFace::Formatter::Html --out test_reports/smoke.html'
  end
}

# Task for the generate the report of the CRUD features files.
task :@crud do
  Cucumber::Rake::Task.new :crud do |t|
    t.profile = 'default'
    sh 'cucumber --tags @crud --format PrettyFace::Formatter::Html --out test_reports/crud.html'
  end
end

# Task for the generate the report of the Functional features files.
task :@functional do
  Cucumber::Rake::Task.new :functional do |t|
    t.profile = 'default'
    sh 'cucumber --tags @functional --format PrettyFace::Formatter::Html --out test_reports/functional.html'
  end
end

# the execute default for the clean.
task(:default).clear

#
task default: :spec
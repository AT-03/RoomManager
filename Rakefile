# Cabero Daniel

require 'bundler/gem_tasks'
require 'rspec'

task :default do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
  task :default => :spec
  puts 'passed'
end

task :@cucumber do
  require 'cucumber'
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new :features do |t|
    t.profile = 'default'
    t.cucumber_opts = 'features'
    sh 'cucumber --tags @cucumber --format PrettyFace::Formatter::Html --out cucumber.html'
  end
end
task :@all do
  require 'cucumber'
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new :all do |t|
    t.profile = 'default'
    sh 'cucumber --format PrettyFace::Formatter::Html --out test_report/all.html'
  end
end

task :@smoke do
  require 'cucumber'
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new :smoke do |t|
    t.profile = 'default'
    sh 'cucumber --tags @smoke --format PrettyFace::Formatter::Html --out test_report/smoke.html'
  end
end

task :@crud do
  Cucumber::Rake::Task.new :crud do |t|
    t.profile = 'default'
    sh 'cucumber --tags @crud --format PrettyFace::Formatter::Html --out test_report/crud.html'
  end
end
task :@functional do
  require 'cucumber'
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new :functional do |t|
    t.profile = 'default'
    sh 'cucumber --tags @functional --format PrettyFace::Formatter::Html --out test_report/functional.html'
  end
end



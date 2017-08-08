# Cabero Daniel


task :default do
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
    require 'rspec'
  RSpec::Core::RakeTask.new
  task :default => :spec
  puts 'paseed'
end

task :@cucumber do
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
  require 'cucumber'
  require 'cucumber/rake/task'
  require 'rspec'
  Cucumber::Rake::Task.new :features do |t|
    t.profile = 'default'
    t.cucumber_opts = 'features'
    sh 'cucumber --tags @cucumber --format PrettyFace::Formatter::Html --out cucumber.html'
  end
end
task :@all do
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
  require 'cucumber'
  require 'cucumber/rake/task'
  require 'rspec'
  Cucumber::Rake::Task.new :all do |t|
    t.profile = 'default'
    sh 'cucumber --format PrettyFace::Formatter::Html --out test_reports/all.html'
  end
end

task :@smoke do
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
  require 'cucumber'
  require 'cucumber/rake/task'
  require 'rspec'
  Cucumber::Rake::Task.new :smoke do |t|
    t.profile = 'default'
    sh 'cucumber --tags @smoke --format PrettyFace::Formatter::Html --out test_reports/smoke.html'
  end
end

task :@crud do
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
  require 'cucumber'
  require 'cucumber/rake/task'
  require 'rspec'
  Cucumber::Rake::Task.new :crud do |t|
    t.profile = 'default'
    sh 'cucumber --tags @crud --format PrettyFace::Formatter::Html --out test_reports/crud.html'
  end
end
task :@functional do
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
  require 'cucumber'
  require 'cucumber/rake/task'
  require 'rspec'
  Cucumber::Rake::Task.new :functional do |t|
    t.profile = 'default'
    sh 'cucumber --tags @functional --format PrettyFace::Formatter::Html --out test_reports/functional.html'
  end
end



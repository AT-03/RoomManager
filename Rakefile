
require 'rubocop/rake_task'
require 'bundler/gem_tasks'
require 'rake/testtask'

  namespace :ci do


  def changed_files
    cmd = %q( git diff --name-only --diff-filter=ACMRTUXB \
      $(git merge-base HEAD master) \
      | egrep '\.rake$|\.rb$' )
    diff = `#{cmd}`
    diff.split("\n")
  end

  def patterns_for_changed_files
    # always include the ci.rake file, if the patterns is empty it runs everything.
    W patterns = ['rake_taks.rake']
    patterns += changed_files
  end

  desc 'Run RuboCop on the entire project'
  RuboCop::RakeTask.new('rubocop') do |task|
    task.fail_on_error = true
  end

  desc 'Run RuboCop on the project based on git diff'
  RuboCop::RakeTask.new('rubocop_changed') do |task|
    task.patterns = patterns_for_changed_files
    task.fail_on_error = true
  end

  RSpec::Core::RakeTask.new
  task :default => :spec

  end


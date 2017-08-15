# Autor Daniel Cabero

# this rake task is run in the travis CI and not failed in this.
require 'bundler/gem_tasks'
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/unit/test*.rb']
end

desc 'Run tests'
task default: :test

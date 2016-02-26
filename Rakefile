require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/*.rb"
end

task :default => :test

desc 'Generates a coverage report'
task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].execute
end

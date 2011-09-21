require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Runs all test files'
task :test do
  system "ruby -Ilib:test test/all.rb"
end

desc 'Generate test coverage report'
task :'test:coverage' do
  require 'cover_me'

  Rake::Task.invoke :test
  CoverMe.complete!
end

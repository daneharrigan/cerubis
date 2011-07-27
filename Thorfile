class Test < Thor
  desc :file, 'Runs a single test file'
  def file(name)
    system "ruby -Ilib:test test/#{name}_test.rb"
  end

  desc :all, 'Runs all test files'
  def all
    test_files = Dir["test/**/*_test.rb"].map { |path| path }
    file_list  = test_files.map { |file| "load '#{file}';" }.join

    system "ruby -Itest:lib -e \"#{file_list}\""
  end
end

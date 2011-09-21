class Test < Thor
  desc :file, 'Runs a single test file'
  def file(name)
    file_name = name == 'all' ? name : "#{name}_test"
    system "ruby -Ilib:test test/#{file_name}.rb"
  end

  desc :all, 'Runs all test files'
  def all
    invoke :file, ['all']
  end

  desc :coverage, 'Generate test coverage report'
  def coverage
    require 'cover_me'

    invoke(:all)
    CoverMe.complete!
  end
end

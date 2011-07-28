require 'bundler/setup'
require 'minitest/autorun'
require 'cerubis'

# test tools
require 'ruby-debug'
require 'capybara'

class StubObject
  def method_missing(*args)
    self.class.new
  end
end

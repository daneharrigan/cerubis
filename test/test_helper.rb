require 'bundler/setup'
require 'minitest/autorun'
require 'cerubis'

# test tools
require 'ruby-debug'
require 'capybara'

class StubObject
  def initialize(methods={})
    @methods = methods
  end

  def method_missing(*args)
    @methods[args.first] || self.class.new
  end
end

Cerubis.register_block :if, StubObject

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

	def respond_to?(*args)
		@methods.include?(args.first.to_sym) || super
	end
end

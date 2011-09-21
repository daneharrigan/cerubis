require 'rubygems'
require 'bundler/setup'

begin
  require 'cover_me'
rescue LoadError
end

require 'minitest/autorun'
require 'cerubis'

# test tools
require 'capybara'

begin
  require 'ruby-debug'
rescue LoadError
end

class StubObject
  def initialize(methods={})
    @methods = methods
  end

  def method_missing(*args)
    @methods[args.first] || self.class.new
  end

	def cerubis_respond_to?(*args)
		@methods.include?(args.first.to_sym) || super
	end
end

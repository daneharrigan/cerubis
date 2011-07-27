require 'test_helper'
require 'matchers/test_operators'
require 'matchers/test_block_name'
require 'matchers/test_object_method'
require 'matchers/test_open_block'
require 'matchers/test_close_block'

class Cerubis::MatcherTest < MiniTest::Unit::TestCase
  include TestOperators
  include TestBlockName
  include TestObjectMethod
  include TestOpenBlock
  include TestCloseBlock
end

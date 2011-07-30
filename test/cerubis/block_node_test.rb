require 'test_helper'
require 'nodes/test_node_defaults'

class Cerubis::BlockNodeTest < MiniTest::Unit::TestCase
  include TestNodeDefaults

  private
    def class_name
      Cerubis::BlockNode
    end
end

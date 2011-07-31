class Cerubis
  module Blocks
    class If
      attr :condition
      attr :node

      def initialize(options)
        @node = options[:node]
        @condition = Condition.new(options[:condition], context: node.context)
      end

      def true?
        condition.true?
      end
    end
  end
end

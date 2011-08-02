class Cerubis
  module Blocks
    class Loop
      include VariableReplacement
      include Block

      def render
        return unless true?
        collection = condition.context_objects[1]
        item_key   = condition.parsed_content[0]

        collection.map do |item|
          replace_variables(node.pre_render, node.context)
        end.join
      end
    end
  end
end

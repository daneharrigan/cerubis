class Cerubis
  module Blocks
    class Loop
      include VariableReplacement
      include Block

      def render
        return unless true?
        collection   = condition.context_objects[1]
        item_key     = condition.parsed_content[0].to_sym
        loop_context = node.context.dup

        collection.map do |item|
          loop_context[item_key] = item
          replace_variables(node.pre_render, loop_context)
        end.join
      end
    end
  end
end

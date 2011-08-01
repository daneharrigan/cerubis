class Cerubis
  module Blocks
    class Loop
      include Block

      def render
        return unless true?
        collection = condition.context_objects[1]
        item_key   = condition.parsed_content[0]

        collection.map do |item|
          # set item_key to item
          # replace variables
          node.pre_render
        end.join
      end
    end
  end
end

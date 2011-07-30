class Cerubis
  class BlockNode
    include Node
    attr_accessor :block

    def render
      define_node!
      parse!

      # DH: not yet
      # return unless block.condition.true?
      return children.map(&:render).join if children?
      content
    end

    private
      def parse!
        self.children = Parser.new(content, parent: self).nodes
      end

      def define_node!
        open_block    = content.match(/^([\s\t]*)(#{Matcher::OpenBlock})/m)
        block_name    = open_block[3].to_sym
        condition_str = open_block[4]

        content.sub!(/^#{open_block[0]}/, open_block[1])
        content.sub!(/#{Matcher::CloseBlock}$/,'')
        self.block = blocks[block_name].new(context: context)
      end

      def blocks
        Cerubis.blocks
      end
  end
end

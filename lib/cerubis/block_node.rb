class Cerubis
  class BlockNode
    include Node

    def render
      define_node!
      parse!

      return children.map(&:render).join if children?
      content
    end

    private
      def parse!
        self.children = Parser.new(content, parent: self).nodes
      end

      def define_node!
        open_block = content.match(/^([\s\t]*)(#{Matcher::OpenBlock})/m)
        content.sub!(/^#{open_block[0]}/, open_block[1])
        content.sub!(/#{Matcher::CloseBlock}$/,'')
        #self.block =
      end
  end
end

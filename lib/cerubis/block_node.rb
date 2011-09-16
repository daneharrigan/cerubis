class Cerubis
  class BlockNode
    include Node
    attr_accessor :block

    def render
      @render ||= begin
        define_node!
        parse!
        block.render
      end
    end

    def pre_render
      return children.map(&:render).join if children?
      content
    end

    private
      def parse!
        self.children = Parser.new(content, :parent => self).nodes
      end

      def define_node!
        open_block    = content.match(/^([\s\t]*)(#{Matcher::OpenBlock})/m)
        close_block   = Matcher::CloseBlockPlaceholder.sub('block_name', open_block[3])
        block_name    = open_block[3].to_sym
        condition_str = open_block[4]

        content.sub!(/^#{open_block[0]}/, open_block[1])
        content.sub!(/#{close_block}+\Z/,'')

        options = { :context => context, :node => self, :condition => condition_str, :type => block_name }
        self.block = blocks[block_name].new(options)
      end

      def blocks
        Cerubis.blocks
      end
  end
end

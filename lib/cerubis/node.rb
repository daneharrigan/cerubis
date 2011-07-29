class Cerubis
  class Node
    attr :content
    attr :parent
    attr_accessor :type
    attr_accessor :condition

    def initialize(content='', options={})
      @content = content
      @parent  = options[:parent]
      define_node!
      parse! unless static?
    end

    def render
      return content unless children?
      children.render
    end

    def children
      @children ||= NodeList.new
    end

    def children?
      @children && !@children.empty?
    end

    def context
      parent.context
    end

    private
      def static?
        self.type == :static
      end

      def parse!
        Parser.new(content, parent: self).nodes.each { |node| children << node }
      end

      def define_node!
        if open_block = content.match(/^([\s\t]*)(#{Matcher::OpenBlock})/m)
          content.sub!(/^#{open_block[0]}/, open_block[1])
          content.sub!(/#{Matcher::CloseBlock}$/,'')

          self.type  = open_block[3].to_sym
          self.condition = Condition.new(open_block[4])
        else
          self.type = :static
        end
      end
  end
end

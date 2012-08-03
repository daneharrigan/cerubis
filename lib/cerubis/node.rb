class Cerubis
  module Node
    def self.included(base)
      base.send(:attr, :content)
      base.send(:attr, :parent)
      base.send(:attr_accessor, :children)
    end

    def initialize(content, options)
      @content  = content
      @parent   = options[:parent]
      @children = []
    end

    def context
      parent.context
    end

    def children?
      !@children.empty?
    end

    def pre_render
      return content
    end
  end
end

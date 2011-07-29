class Cerubis
  class TextNode
    attr :content
    attr :parent

    def initialize(content, options)
      @content = content
      @parent  = options[:parent]
    end

    def render
      return content
    end

    def context
      parent.context
    end
  end
end

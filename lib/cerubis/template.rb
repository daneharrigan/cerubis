class Cerubis
  class Template
    attr :content
    attr :context
    attr :nodes

    def initialize(content, context={})
      @content = content
      @context = Context.new(context)
      @nodes   = Parser.new(@content, :parent => self).nodes
    end

    def compile
      @template ||= nodes.map(&:render).join
    end

    alias :to_html :compile
    alias :to_text :compile
    alias :to_s    :compile
  end
end

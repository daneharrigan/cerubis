class Cerubis
  class Template
    attr :content
    attr :context
    attr :nodes

    def initialize(content, context={})
      @content = content
      @context = context
      @nodes = Parser.new(@content).nodes
    end

    def compile
      nodes.map(&:render).join
    end

    alias :to_html :compile
    alias :to_text :compile
    alias :to_s    :compile
  end
end

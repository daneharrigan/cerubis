class Cerubis
  class NodeList < Array
    attr :parent

    def initialize(parent)
      @parent = parent
      super(0)
    end

    def <<(item)
      item.parent = parent
      super
    end

    def render
      self.map(&:render).join
    end
  end
end

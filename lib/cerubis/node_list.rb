class Cerubis
  class NodeList < Array
    def render
      self.map(&:render).join
    end
  end
end

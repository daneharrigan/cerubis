class Cerubis
  class Condition
    attr :content

    def initialize(content)
      @content = content.strip
    end
  end
end

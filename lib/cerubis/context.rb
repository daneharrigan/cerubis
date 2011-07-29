class Cerubis
  class Context < Hash
    def initialize(hash)
      super(nil)
      hash.each { |key, value| self[key] = value }
    end
  end
end

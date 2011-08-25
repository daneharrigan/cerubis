class Cerubis
  class Helper
    def initialize
      Cerubis.helpers.each { |mod| self.extend mod }
    end
  end
end

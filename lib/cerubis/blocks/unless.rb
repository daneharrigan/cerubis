class Cerubis
  module Blocks
    class Unless < If
      def true?
        !super
      end
    end
  end
end

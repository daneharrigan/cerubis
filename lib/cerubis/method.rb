class Cerubis
  module Method
    def self.included(base)
      base.extend ClassMethods
    end

    def cerubis_respond_to?(meth)
      availabe_methods = self.class.instance_variable_get(:@cerubis_method) || []
      availabe_methods.include? meth
    end

    module ClassMethods
      def cerubis_method(*args)
        @cerubis_method ||= []
        @cerubis_method  += args
      end
    end
  end
end

class Cerubis
  class Context < Hash
    def initialize(hash={})
      super(nil)
      hash.each { |key, value| self[key] = value }
    end

		def get(key)
			case key
				when /^true$/   then true
				when /^false$/  then false
				when /^[0-9]+$/ then Integer(key)
				when /^[0-9]+\.[0-9]+$/ then Float(key)
				else
					object_methods = key.split('.')
					object = self[object_methods.shift.to_sym]
					while meth = object_methods.shift do
						object = object.respond_to?(meth) ? object.send(meth) : nil
					end

					object
			end
		end
  end
end

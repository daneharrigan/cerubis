class Cerubis
  class Condition
    attr :content
    attr :type
    attr :context
    attr :context_objects
    attr :parsed_content

    def initialize(content, options={})
      @content = content.strip
      @context = options[:context]
      @type    = options[:type]
      @context_objects = []

      define_condition!
    end

    def true?
      if @parsed_content.size == 3
        validate_object_and_operator
      else
        validate_object
      end
    end

    private
      def define_condition!
        match = content.match Matcher::Conditions
        @parsed_content = [match[1], match[5], match[6]].compact
      end

      def validate_object
        @context_objects << context.get(@parsed_content[0])
        @context_objects[0]
      end

      def validate_object_and_operator
        operator     = @parsed_content[1].to_sym
        obj          = context.get(@parsed_content[0])
        obj_compared = context.get(@parsed_content[2])

        @context_objects << obj
        @context_objects << obj_compared

        case operator
          when :==    then (obj ==  obj_compared)
          when :===   then (obj === obj_compared)
          when :'!='  then (obj !=  obj_compared)
          when :<     then (obj <   obj_compared)
          when :>     then (obj >   obj_compared)
          when :<=    then (obj <=  obj_compared)
          when :>=    then (obj >=  obj_compared)
          when :in
            raise SyntaxError, 'Invalid block conditions' unless type == :loop
            obj_compared && !obj_compared.empty?
        end
      end
  end
end

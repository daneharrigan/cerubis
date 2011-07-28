class Cerubis
  class Condition
    attr :content
    attr :type
    attr :context

    def initialize(content, options={})
      @content = content.strip
      @context = options[:context]
      @type    = options[:type]
      @true    = false
      @repeat  = false

      define_condition!
    end

    def true?
      @true
    end

    def repeat?
      @repeat
      return false if [:if, :unless].include?(type)
    end

    private
      def define_condition!
        match = content.match Matcher::Conditions
        @parsed_content = [match[1], match[4], match[5]].compact

        if @parsed_content.size == 3
          validate_object_and_operator
        else
          validate_object
        end
      end

      def validate_object
        case context.find(@parsed_content[0])
          when TrueClass
        end
      end

      def validate_object_and_operator

      end
  end
end

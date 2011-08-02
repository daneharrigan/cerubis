class Cerubis
  module Block
    def self.included(base)
      base.send(:attr, :condition)
      base.send(:attr, :node)
    end

    def initialize(options)
      @node = options[:node]
      @condition = Condition.new(options[:condition], context: node.context, type: options[:type])
    end

    def true?
      condition.true?
    end

    def render
      return unless true?
      replace_variables(node.pre_render, node.context)
    end
  end
end

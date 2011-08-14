class Cerubis
  module VariableReplacement
    def replace_variables(str, context)
      str.gsub(Matcher::Variable) do |variable|
        key = variable.match(Matcher::Variable)[1]
        context.get(key)
      end
    end
  end
end

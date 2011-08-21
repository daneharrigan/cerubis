class Cerubis
  module VariableReplacement
    def replace_variables(str, ctx)
      str.gsub(Matcher::Variable) do |variable|
        match_var = variable.match(Matcher::Variable)[1]
        #if match = match_var.match(Matcher::Helpers)
        #  helper_method = match[1]
        #  helper_args   = match[2].to_s.split(Matcher::CommaOutsideQuote).map do |arg|
        #    ctx.get(arg.strip)
        #  end
        #
        #  # NOTE DH: Come back here
        #  helper_args.join('|')
        #else
          ctx.get(match_var)
        #end
      end
    end
  end
end

class Cerubis
  module VariableReplacement
    def replace_variables(str, ctx)
      str.gsub(Matcher::Variable) do |variable|
        match_var = variable.match(Matcher::Variable)[1]
        if match = match_var.match(Matcher::Helpers)
          helper_method = match[1]
          helper_args   = match[2].to_s.split(Matcher::CommaOutsideQuote).map do |arg|
            ctx.get(arg.strip)
          end

          begin
            if helper_mod = Cerubis.helpers[helper_method.to_sym] || Cerubis.helpers[helper_method]
              helper = Helper.new
              helper.extend helper_mod

              if has_public_method?(helper, helper_method)
                helper.send(helper_method, *helper_args)
              end
            end
          rescue ArgumentError
            raise SyntaxError, "A wrong number of arguments were passed to '#{helper_method}'"
          end
        else
          ctx.get(match_var)
        end
      end
    end

    def has_public_method?(obj, meth)
      obj.public_methods.include?(meth) || obj.public_methods.include?(meth.to_sym)
    end
  end
end

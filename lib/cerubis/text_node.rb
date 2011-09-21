class Cerubis
  class TextNode
    include Node
    include VariableReplacement

		def render
			replace_variables(pre_render)
		end
  end
end

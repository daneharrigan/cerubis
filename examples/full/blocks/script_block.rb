class ScriptBlock
  include Cerubis::VariableReplacement
  include Cerubis::Block

  def render
    %{<script>#{replace_variables(node.pre_render, node.context)}</script>}
  end
end

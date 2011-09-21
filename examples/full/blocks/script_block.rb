class ScriptBlock
  include Cerubis::VariableReplacement
  include Cerubis::Block

  def render
    %{<script>#{replace_variables(yield)}</script>}
  end
end

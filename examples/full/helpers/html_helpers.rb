module HTMLHelpers
  def stylesheet_link_tag(name)
    %{<link href="/stylesheets/#{name}.css" rel="stylesheet">}
  end

  def javascript_include_tag(name)
    %{<script src="/javascripts/#{name}.js"></script>}
  end

  def link_to(title, url)
    %{<a href="#{url}">#{title}</a>}
  end
end

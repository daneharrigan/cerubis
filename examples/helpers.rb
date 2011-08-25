require 'bundler/setup'
require 'cerubis'

Page = Struct.new(:title, :permalink)
page = Page.new('Homepage', '/')

module LinkTo
  def link_to(page_or_title, permalink='')
    title = page_or_title.is_a?(String) ? page_or_title : page_or_title.title
    permalink = page_or_title.permalink unless page_or_title.is_a?(String)

    %{<a href="#{permalink}">#{title}</a>}
  end
end

content = <<-STR
1: {{ link_to page }}
2: {{ link_to 'About Us', '/about-us' }}
STR

Cerubis.register_helper LinkTo
puts Cerubis.render(content, page: page)

require 'bundler/setup'
require 'cerubis'

content = <<-STR
<html>
  <body>
    {{#if true}}
      <h1>Header Content</h1>
      {{#if true}}
        <p>Branding Message</p>
      {{/if}}
    {{/if}}
  </body>
</html>
STR

template = Cerubis.render(content)
puts template.to_html

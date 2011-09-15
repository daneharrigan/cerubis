require 'bundler/setup'
require 'cerubis'

content = <<-STR
<html>
  {{#if true}}
    <header>
      {{#unless false}}
        <ul>
          {{#loop item in collection}}
            <li>{{item}}</li>
          {{/loop}}
        </ul>
      {{/unless}}
    </header>
  {{/if}}
</html>
STR

puts Cerubis.render(content, collection: [1,2,3])

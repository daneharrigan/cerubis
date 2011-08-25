require 'bundler/setup'
require 'cerubis'

content = <<-STR
  Welcome {{name}}!
  You are {{age}} years old today
STR

template = Cerubis.render(content, name: 'John Smith', age: 26)
puts template.to_html

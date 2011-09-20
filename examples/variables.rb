require 'bundler/setup'
require 'cerubis'

content = <<-STR
  Welcome {{name}}!
  You are {{age}} years old today
STR

template = Cerubis.render(content, name: 'Dane Harrigan', age: 26)
puts template.to_html

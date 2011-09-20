ExampleRoot = File.expand_path(File.dirname(__FILE__))
$: << ExampleRoot

require 'config'

# create page objects
subpages = [
  Page.new('Sub-page: 1'),
  Page.new('Sub-page: 2'),
  Page.new('Sub-page: 3'),
  Page.new('Sub-page: 4'),
  Page.new('Sub-page: 5')
]

homepage = Page.new('Example Page Title', subpages)

# create site object
site = Site.new('Example Site', homepage: homepage)

# get main template
content = File.read("#{ExampleRoot}/templates/main.cerubis")

# render template
template = Cerubis.render(content, page: homepage, site: site, current_year: Time.now.year)
puts template.to_html

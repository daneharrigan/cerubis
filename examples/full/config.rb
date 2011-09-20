require 'bundler/setup'
require 'cerubis'
require 'helpers/html_helpers'
require 'helpers/include_helper'
require 'blocks/script_block'
require 'models/page'
require 'models/site'

# register blocks
Cerubis.register_block :script, ScriptBlock

# register helpers
Cerubis.register_helper :stylesheet_link_tag, :javascript_include_tag, :link_to, HTMLHelpers
Cerubis.register_helper :include, IncludeHelper

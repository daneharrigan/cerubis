require 'cerubis/block'
require 'cerubis/blocks/if'
require 'cerubis/blocks/unless'
require 'cerubis/blocks/loop'

class Cerubis
  autoload :Node,        'cerubis/node'
  autoload :TextNode,    'cerubis/text_node'
  autoload :BlockNode,   'cerubis/block_node'
  autoload :Matcher,     'cerubis/matcher'
  autoload :Template,    'cerubis/template'
  autoload :Parser,      'cerubis/parser'
  autoload :Condition,   'cerubis/condition'
  autoload :Context,     'cerubis/context'
  autoload :SyntaxError, 'cerubis/syntax_error'

  def self.register_block(name, klass)
    blocks[name] = klass
  end

  def self.blocks
    @blocks ||= {}
  end

  def self.render(template, context={})
    new.render(template, context)
  end

  def render(template, context={})
    Template.new(template, context)
  end
end

Cerubis.register_block :if, Cerubis::Blocks::If
Cerubis.register_block :unless, Cerubis::Blocks::Unless
Cerubis.register_block :loop, Cerubis::Blocks::Loop

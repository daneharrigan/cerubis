require 'cerubis/variable_replacement'
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
  autoload :Method,      'cerubis/method'
  autoload :Helper,      'cerubis/helper'
  autoload :SyntaxError, 'cerubis/syntax_error'

  def self.register_block(name, klass)
    blocks[name] = klass
  end

  def self.register_helper(*mods)
    mod = mods.pop
    mods.each { |key| helpers[key] = mod }
  end

  def self.blocks
    @blocks ||= {}
  end

  def self.helpers
    @helpers ||= {}
  end

  def self.render(template, context={})
    new.render(template, context)
  end

  def render(template, context={})
    Template.new(template, context)
  end
end

# Patching Ruby core objects
require 'cerubis/ext/array'
require 'cerubis/ext/float'
require 'cerubis/ext/fixnum'
require 'cerubis/ext/hash'
require 'cerubis/ext/string'

Cerubis.register_block :if, Cerubis::Blocks::If
Cerubis.register_block :unless, Cerubis::Blocks::Unless
Cerubis.register_block :loop, Cerubis::Blocks::Loop

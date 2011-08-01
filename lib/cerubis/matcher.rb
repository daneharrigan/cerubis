class Cerubis
  module Matcher
    OpenTag       = '{{'
    CloseTag      = '}}'
    BlockName     = '[a-z_]+'
    ObjectMethod  = '[a-z0-9_]+((\.[a-z_0-9]+\??)+)?'
    Operators     = [:==, :===, :'!=', :'!==', :<, :>, :<=, :>=, :in]
    Conditions    = /(#{ObjectMethod})(\s*(#{Operators.join('|')})\s*(#{ObjectMethod}))?/
    OpenBlockStr  = "#{OpenTag}\#(#{BlockName})(\s+#{Conditions})?#{CloseTag}"
    CloseBlockPlaceholder = "#{OpenTag}\/(block_name)#{CloseTag}"
    CloseBlockStr = CloseBlockPlaceholder.sub('block_name', BlockName)
    OpenBlock     = /#{OpenBlockStr}/
    CloseBlock    = /#{CloseBlockStr}/
    Variable      = /#{OpenTag}\s*(#{ObjectMethod})\s*#{CloseTag}/
  end
end

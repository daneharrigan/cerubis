class Cerubis
  module Matcher
    OpenTag       = '{{'
    CloseTag      = '}}'
    BlockName     = '[a-z_]+'
    Method        = '[a-z_0-9]+'
    ObjectMethod  = /\'([^\']*)\'|[a-z0-9_]+((\.#{Method}\??)+)?/
    Operators     = [:==, :===, :'!=', :'!==', :<, :>, :<=, :>=, :in]
    Conditions    = /(#{ObjectMethod})(\s*(#{Operators.join('|')})\s*(#{ObjectMethod}))?/
    OpenBlockStr  = "#{OpenTag}\#(#{BlockName})(\s+#{Conditions})?#{CloseTag}"
    CloseBlockPlaceholder = "#{OpenTag}\/(block_name)#{CloseTag}"
    CloseBlockStr = CloseBlockPlaceholder.sub('block_name', BlockName)
    OpenBlock     = /#{OpenBlockStr}/
    CloseBlock    = /#{CloseBlockStr}/
    OpenHelper    = /#{Method}\(/
    CloseHelper   = /\)/
    Helper        = /(#{OpenHelper})+(#{OpenHelper}|#{CloseHelper}|#{ObjectMethod})+(,\s*(#{OpenHelper}|#{CloseHelper}|#{ObjectMethod}))*#{CloseHelper}+/
    Variable      = /#{OpenTag}\s*(#{Helper}|#{ObjectMethod})\s*#{CloseTag}/
  end
end

require 'strscan'

class Cerubis
  class Parser
    attr :nodes

    def initialize(content='', options)
      @content = content
      @options = options
      @scanner = StringScanner.new(@content)
      @nodes   = []
      parse!
    end

    private
      def parse!
        @default_regex = Regexp.new("(#{Matcher::OpenBlock})|(#{Matcher::CloseBlock})")
        @current_regex = @default_regex
        @blocks = []

        record_positions until @scanner.eos?
        raise SyntaxError, "An open block is not closed" if blocks_not_closed?

        build_nodes
      end

      def build_nodes
        if !@blocks.empty?
          str_position = @blocks.first[1] # start of first block
          @blocks.unshift([:text, 0, str_position-1]) unless str_position.zero?

          str_position = @blocks.last[2] # end of last block
          if str_position != @content.size
            @blocks << [:text, str_position+1, @content.size]
          end
        end

        create_node(@blocks.shift) until @blocks.empty?
      end

      def create_node(block)
        start_of_str = block[1]
        end_of_str   = block[2]
        content      = @content[start_of_str...end_of_str]

        if block[0] == :text
          @nodes << TextNode.new(content, @options)
        else
          @nodes << BlockNode.new(content, @options)
        end
      end

      def record_positions
        @scanner.scan_until @current_regex
        current_match = @scanner[0]

        if current_match
          if current_match =~ Matcher::OpenBlock
            parse_open_block
          elsif current_match =~ Matcher::CloseBlock
            parse_close_block
          end
        else
          @scanner.terminate
        end
      end

      def nested_block?
        return false if @blocks.empty?
        return false if @blocks.last.is_a?(Array) && @blocks.last.size == 3
        true
      end

      def blocks_not_closed?
        # a proper closed block is prepresented as an array of 3 elements
        # [block_name, start_of_block, end_of_block]
        # any less than 3 and its not closed
        !@blocks.empty? && (!@blocks.last.is_a?(Array) || @blocks.last.size < 3)
      end

      def parse_open_block
        block_name = @scanner[2].to_sym
        close_regex = Matcher::CloseBlockPlaceholder.sub('block_name', @scanner[2])
        @current_regex = Regexp.new("(#{Matcher::OpenBlock})|(#{close_regex})")

        if nested_block?
          @blocks << block_name
        else
          @blocks << [block_name, @scanner.pos - @scanner.matched_size]
        end
      end

      def parse_close_block
        raise SyntaxError, 'Closing block was found without an opening' if @blocks.empty?
        block_name = @scanner[11].to_sym

        if @blocks.last == block_name # found the nested closing block
          @blocks.pop
        elsif @blocks && @blocks.last.is_a?(Array) && @blocks.last[0] == block_name
          @blocks.last << @scanner.pos
        end
      end
  end
end

module MarkdownMetrics
  class TopElementsParser
    attr_reader :elements

    def initialize(lines)
      @lines = lines
      @elements = []
    end

    def parse
      @lines.each_with_index_and_catch do |line, index|
        element = initialize_element(line, index)
        @elements << {
          name: element.name,
          value: element.value
        }.merge(element.attributes)
        
        throw :skip_iteration, element.skip_lines_until if element.skip_lines_until > 0
      end
    end

    private

    def initialize_element(line, index)
      MarkdownMetrics::LineTopElement.match_element(
        line, @lines[index + 1]
      ).new(lines: @lines, start_at: index)
    end
  end
end

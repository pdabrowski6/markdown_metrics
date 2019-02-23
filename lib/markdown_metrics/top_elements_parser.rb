module MarkdownMetrics
  class TopElementsParser
    attr_reader :elements

    def initialize(lines)
      @lines = lines
      @elements = []
    end

    def parse
      @lines.each_with_index do |line, index|
        element = initialize_element(line, index)
        @elements << {
          name: element.name,
          value: element.value
        }
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

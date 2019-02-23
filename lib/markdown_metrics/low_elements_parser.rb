module MarkdownMetrics
  class LowElementsParser
    attr_reader :elements

    def initialize(value:)
      @value = value
      @elements = []
    end

    def parse
      @value.each_character_with_index do |chr, index|
        element = initialize_element(chr, index)
        @elements << {
          name: element.name,
          value: element.value
        }.merge(element.attributes)
        
        throw :skip_iteration, element.skip_lines_until if element.skip_lines_until > 0
      end
    end

    private

    def initialize_element(chr, index)
      MarkdownMetrics::LineLowElement.match_element(
        chr, @value[index + 1]
      ).new(value: @value, start_at: index)
    end
  end
end

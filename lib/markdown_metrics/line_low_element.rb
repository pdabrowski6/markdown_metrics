# frozen_string_literal: true

module MarkdownMetrics
  class LineLowElement
    ELEMENTS = [
      MarkdownMetrics::Elements::Sentence::Bold,
      MarkdownMetrics::Elements::Sentence::Italic,
      MarkdownMetrics::Elements::Sentence::Link,
      MarkdownMetrics::Elements::Sentence::Code,
      MarkdownMetrics::Elements::Sentence::Text
    ].freeze

    def self.match_element(character, next_character)
      ELEMENTS.find do |element_class|
        element_class.match_element(character, next_character)
      end
    end
  end
end

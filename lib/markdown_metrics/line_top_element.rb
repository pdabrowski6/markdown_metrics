# frozen_string_literal: true

module MarkdownMetrics
  class LineTopElement
    ELEMENTS = [
      MarkdownMetrics::Elements::Block::List,
      MarkdownMetrics::Elements::Block::Pre,
      MarkdownMetrics::Elements::Block::Quote,
      MarkdownMetrics::Elements::Block::Table,
      MarkdownMetrics::Elements::Inline::H1,
      MarkdownMetrics::Elements::Inline::H2,
      MarkdownMetrics::Elements::Inline::H3,
      MarkdownMetrics::Elements::Inline::H4,
      MarkdownMetrics::Elements::Inline::H5,
      MarkdownMetrics::Elements::Inline::H6,
      MarkdownMetrics::Elements::Inline::Image,
      MarkdownMetrics::Elements::Inline::Pre,
      MarkdownMetrics::Elements::Inline::EmptyLine,
      MarkdownMetrics::Elements::Inline::Paragraph
    ].freeze

    def self.match_element(line, next_line)
      ELEMENTS.find do |element_class|
        element_class.match_element(line, next_line)
      end
    end
  end
end

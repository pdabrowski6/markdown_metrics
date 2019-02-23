# frozen_string_literal: true

require 'extensions/string'
require 'extensions/array'

require 'markdown_metrics/elements/base'

require 'markdown_metrics/elements/inline/h1'
require 'markdown_metrics/elements/inline/h2'
require 'markdown_metrics/elements/inline/h3'
require 'markdown_metrics/elements/inline/h4'
require 'markdown_metrics/elements/inline/h5'
require 'markdown_metrics/elements/inline/h6'
require 'markdown_metrics/elements/inline/image'
require 'markdown_metrics/elements/inline/pre'
require 'markdown_metrics/elements/inline/empty_line'
require 'markdown_metrics/elements/inline/paragraph'

require 'markdown_metrics/elements/block/table'
require 'markdown_metrics/elements/block/pre'
require 'markdown_metrics/elements/block/quote'
require 'markdown_metrics/elements/block/list'

require 'markdown_metrics/elements/sentence/base'
require 'markdown_metrics/elements/sentence/bold'
require 'markdown_metrics/elements/sentence/italic'
require 'markdown_metrics/elements/sentence/link'
require 'markdown_metrics/elements/sentence/code'
require 'markdown_metrics/elements/sentence/text'

require 'markdown_metrics/file_lines'
require 'markdown_metrics/line_top_element'
require 'markdown_metrics/top_elements_parser'
require 'markdown_metrics/line_low_element'
require 'markdown_metrics/low_elements_parser'

module MarkdownMetrics
  ELEMENTS_WITH_LOW_ELEMENTS = %i[table paragraph list h1 h2 h3 h4 h5 h6 quote]

  class << self
    def generate(file_path:)
      file_lines = MarkdownMetrics::FileLines.from(file_path)
      top_elements_parser = MarkdownMetrics::TopElementsParser.new(file_lines)
      top_elements_parser.parse

      top_elements_parser.elements.map do |element|
        unless ELEMENTS_WITH_LOW_ELEMENTS.include?(element[:name])
          element
        else
          if element[:name] == :table
            new_rows = []
            element[:value][:rows].each do |r|
              new_rows << r.map do |row|
                low_elements(row)
              end
            end

            element[:value].merge!(rows: new_rows)
            element
          else
            low_level_values = if element[:value].kind_of?(Array)
              element[:value].map { |v| low_elements(v) }
            else
              low_elements(element[:value])
            end

            element.merge(value: low_level_values)
          end
        end
      end
    end

    private

    def low_elements(value)
      parser = MarkdownMetrics::LowElementsParser.new(value: value)
      parser.parse
      parser.elements
    end
  end
end

# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class EmptyLine < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.nil? || line == ''
        end

        def name
          :empty_line
        end

        def value
          nil
        end
      end
    end
  end
end

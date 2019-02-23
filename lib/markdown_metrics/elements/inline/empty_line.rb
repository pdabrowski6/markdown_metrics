# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class EmptyLine
        def self.match(line, next_line)
          line.nil? || line == ''
        end

        def self.element_name
          :empty_line
        end

        def self.value(line)
          nil
        end
      end
    end
  end
end

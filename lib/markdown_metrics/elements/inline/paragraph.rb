# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class Paragraph
        def self.match(line, next_line)
          !line.nil? && line != ''
        end

        def self.element_name
          :paragraph
        end

        def self.value(line)
          line
        end
      end
    end
  end
end

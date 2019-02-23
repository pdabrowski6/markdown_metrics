# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class Quote
        def self.match_element(line, next_line)
          line.to_s.match(/^\>/)
        end

        def self.element_name
          :quote
        end
      end
    end
  end
end

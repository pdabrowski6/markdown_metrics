# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class Pre
        def self.match_element(line, next_line)
          line.to_s.match(/^```(?<language>.*)/)
        end

        def self.element_name
          :pre
        end
      end
    end
  end
end

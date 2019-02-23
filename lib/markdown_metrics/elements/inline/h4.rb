# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H4
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{4} .*/)
        end

        def self.element_name
          :h4
        end

        def self.value(line)
          line.gsub(/^\#{4} /, '')
        end
      end
    end
  end
end

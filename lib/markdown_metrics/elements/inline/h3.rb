# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H3
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{3} .*/)
        end

        def self.element_name
          :h3
        end

        def self.value(line)
          line.gsub(/^\#{3} /, '')
        end
      end
    end
  end
end

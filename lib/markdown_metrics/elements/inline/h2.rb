# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H2
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{2} .*/)
        end

        def self.element_name
          :h2
        end

        def self.value(line)
          line.gsub(/^\#{2} /, '')
        end
      end
    end
  end
end

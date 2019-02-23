# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H2
        def self.match(line, next_line)
          line.match(/^\#{2} .*/)
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

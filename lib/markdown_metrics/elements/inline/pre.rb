# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class Pre
        def self.match_element(line, next_line)
          line.to_s.match(/\s{4}.*/)
        end

        def self.element_name
          :pre
        end

        def self.value(line)
          line.gsub(/\s{4}/, '')
        end
      end
    end
  end
end

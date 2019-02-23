# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H3
        def self.matching_rule
          /^\#{3} .*/
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

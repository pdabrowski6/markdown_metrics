# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H4
        def self.matching_rule
          /^\#{4} .*/
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

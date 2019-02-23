# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H1
        def self.matching_rule
          /^\#{1} .*/
        end

        def self.element_name
          :h1
        end

        def self.value(line)
          line.gsub(/^\#{1} /, '')
        end
      end
    end
  end
end

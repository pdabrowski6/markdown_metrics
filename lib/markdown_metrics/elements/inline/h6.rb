# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H6
        def self.matching_rule
          /^\#{6} .*/
        end

        def self.element_name
          :h6
        end

        def self.value(line)
          line.gsub(/^\#{6} /, '')
        end
      end
    end
  end
end

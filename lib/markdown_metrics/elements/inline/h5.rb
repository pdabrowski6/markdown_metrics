# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H5
        def self.matching_rule
          /^\#{5} .*/
        end

        def self.element_name
          :h5
        end

        def self.value(line)
          line.gsub(/^\#{5} /, '')
        end
      end
    end
  end
end

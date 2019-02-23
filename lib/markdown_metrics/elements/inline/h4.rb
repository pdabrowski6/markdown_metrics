# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H4 < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{4} .*/)
        end

        def name
          :h4
        end

        def value
          current_line.gsub(/^\#{4} /, '')
        end
      end
    end
  end
end

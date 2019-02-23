# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H3 < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{3} .*/)
        end

        def name
          :h3
        end

        def value
          current_line.gsub(/^\#{3} /, '')
        end
      end
    end
  end
end

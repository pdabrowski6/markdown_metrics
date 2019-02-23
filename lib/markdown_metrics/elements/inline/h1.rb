# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H1 < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{1} .*/)
        end

        def name
          :h1
        end

        def value
          current_line.gsub(/^\#{1} /, '')
        end
      end
    end
  end
end

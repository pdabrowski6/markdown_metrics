# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H2 < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{2} .*/)
        end

        def name
          :h2
        end

        def value
          current_line.gsub(/^\#{2} /, '')
        end
      end
    end
  end
end

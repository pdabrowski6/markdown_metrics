# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H6 < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{6} .*/)
        end

        def name
          :h6
        end

        def value
          current_line.gsub(/^\#{6} /, '')
        end
      end
    end
  end
end

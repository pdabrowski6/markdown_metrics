# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class Pre < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/\s{4}.*/)
        end

        def name
          :pre
        end

        def value
          current_line.gsub(/\s{4}/, '')
        end
      end
    end
  end
end

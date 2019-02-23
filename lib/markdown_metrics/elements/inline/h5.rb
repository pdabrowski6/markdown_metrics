# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class H5 < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\#{5} .*/)
        end

        def name
          :h5
        end

        def value
          current_line.gsub(/^\#{5} /, '')
        end
      end
    end
  end
end

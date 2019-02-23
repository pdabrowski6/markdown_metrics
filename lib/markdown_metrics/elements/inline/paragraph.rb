# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class Paragraph < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          !line.nil? && line != ''
        end

        def name
          :paragraph
        end

        def value
          current_line
        end
      end
    end
  end
end

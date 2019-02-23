# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class Paragraph
        def self.element_name
          :paragraph
        end

        def self.value(line)
          line
        end
      end
    end
  end
end

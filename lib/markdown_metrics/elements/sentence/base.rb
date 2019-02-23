# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Sentence
      class Base
        attr_accessor :skip_lines_until

        def initialize(value:, start_at:)
          @value = value
          @start_at = start_at
          @skip_lines_until = 0
        end

        def attributes
          {}
        end
      end
    end
  end
end

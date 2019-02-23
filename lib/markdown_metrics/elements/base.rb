module MarkdownMetrics
  module Elements
    class Base
      attr_reader :skip_lines_until

      def initialize(lines:, start_at:)
        @lines = lines
        @start_at = start_at
        @skip_lines_until = 0
      end

      def attributes
        {}
      end

      private

      def current_line
        @lines[@start_at]
      end
    end
  end
end

module MarkdownMetrics
  module Elements
    class Base
      def initialize(lines:, start_at:)
        @lines = lines
        @start_at = start_at
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

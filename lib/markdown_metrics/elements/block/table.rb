# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class Table
        def self.match_element(line, next_line)
          line.to_s.match(/^.* \| .*$/) && next_line.to_s.match(/^\-{1,} \| \-{1,}$/)
        end

        def self.element_name
          :table
        end
      end
    end
  end
end

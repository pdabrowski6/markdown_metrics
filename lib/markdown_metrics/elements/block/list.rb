# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class List
        def self.match_element(line, next_line)
          line.to_s.match(/^\- .*/) || line.to_s.match(/^\d+. .*/) || line.to_s.match(/^\* .*/)
        end

        def self.element_name
          :list
        end
      end
    end
  end
end

# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class Pre < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^```(?<language>.*)/)
        end

        def name
          :pre
        end

        def value
          end_line = nil
          next_line = @start_at

          @lines[(@start_at + 1)..-1].each do |code_line|
            next_line += 1
            if code_line == '```'
              end_line = next_line
              break
            end

            end_line = @lines.size - 1 if end_line.nil?
          end

          if !end_line.nil?
            @skip_lines_until = end_line
            @lines[(@start_at + 1)..(end_line - 1)].join("\n")
          end
        end

        def attributes
          language_name = current_line.match(/^```(?<language>.*)/)['language']

          { language: language_name }
        end
      end
    end
  end
end

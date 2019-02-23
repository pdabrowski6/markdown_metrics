# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class Quote < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\>/)
        end

        def name
          :quote
        end

        def value
          end_line = nil
          next_line = @start_at

          @lines[(@start_at + 1)..-1].each do |code_line|
            next_line += 1
            unless code_line.match(/^\>/)
              end_line = next_line - 1
              break
            end

            end_line = @lines.size - 1 if end_line.nil?
          end

          if !end_line.nil?
            @skip_lines_until = end_line
            @lines[@start_at..end_line].map { |e| e[1..-1] }
          end
        end
      end
    end
  end
end

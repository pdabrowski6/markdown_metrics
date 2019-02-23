# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class Table < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^.* \| .*$/) && next_line.to_s.match(/^\-{1,} \| \-{1,}$/)
        end

        def name
          :table
        end

        def value
          headers = current_line.split("|")
          rows = []
          end_line = nil
          next_line = @start_at

          @lines[(@start_at + 2)..-1].each do |code_line|
            next_line += 1
            unless code_line.match(/^.* \| .*$/)
              end_line = next_line
              break
            end

            end_line = @lines.size - 1 if end_line.nil?
          end

          if !end_line.nil?
            @skip_lines_until = end_line
            @lines[@start_at+2..end_line].each do |row_line|
              rows << row_line.split("|")
            end

            { rows: rows, headers: headers }
          end
        end
      end
    end
  end
end

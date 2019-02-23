# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Block
      class List < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\- .*/) || line.to_s.match(/^\d+. .*/) || line.to_s.match(/^\* .*/)
        end

        def name
          :list
        end

        def value
          end_line = nil
          next_line = @start_at

          @lines[(@start_at + 1)..-1].each do |code_line|
            next_line += 1
            unless code_line.match(value_regex)
              end_line = next_line - 1
              break
            end

            end_line = @lines.size - 1 if end_line.nil?
          end

          if !end_line.nil?
            @skip_lines_until = end_line
            if list_type == :number
              @lines[@start_at..end_line].map { |e| e[2..-1] }
            else
              @lines[@start_at..end_line].map { |e| e[1..-1] }
            end
          end
        end

        def attributes
          { type: list_type }
        end

        private

        def value_regex
          if list_type == :dash
            /^\- .*/
          elsif list_type == :number
            /^\d+. .*/
          elsif list_type == :star
            /^\* .*/
          end
        end

        def list_type
          if current_line.match(/^\- .*/)
            :dash
          elsif current_line.match(/^\d+. .*/)
            :number
          elsif current_line.match(/^\* .*/)
            :star
          end
        end
      end
    end
  end
end

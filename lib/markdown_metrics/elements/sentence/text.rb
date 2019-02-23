# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Sentence
      class Text < MarkdownMetrics::Elements::Sentence::Base
        def self.match_element(character, next_character)
          return false if ['*', '`'].include?(character)
          return true if character != '('

          next_character != '['
        end

        def name
          :text
        end

        def value
          final_value = nil

          @value.each_character_with_index_from(@start_at + 1) do |chr2, index2|
            if @value[index2 + 1].nil?
              @skip_lines_until = index2 + 2
              final_value = @value[@start_at..index2]
              break
            elsif chr2 == "`" || chr2 == "*" || (chr2 == "(" && @value[index2 + 1] == "[")
              @skip_lines_until = index2 - 1
              final_value = @value[@start_at..(index2 - 1)]
              break
            end
          end

          final_value
        end
      end
    end
  end
end

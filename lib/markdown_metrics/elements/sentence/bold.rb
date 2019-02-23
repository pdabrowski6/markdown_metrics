# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Sentence
      class Bold < MarkdownMetrics::Elements::Sentence::Base
        def self.match_element(character, next_character)
          character.to_s == '*' && next_character.to_s == '*'
        end

        def name
          :bold
        end

        def value
          final_value = nil

          @value.each_character_with_index_from(@start_at + 2) do |chr2, index2|
            next unless @value[index2..(index2 + 1)] == '**'

            final_value = @value[@start_at + 2..(index2 - 1)]
            @skip_lines_until = index2 + 1
            break
          end

          final_value
        end
      end
    end
  end
end

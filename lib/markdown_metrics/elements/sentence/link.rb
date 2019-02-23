# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Sentence
      class Link < MarkdownMetrics::Elements::Sentence::Base
        def self.match_element(character, next_character)
          character.to_s == '(' && next_character.to_s == '['
        end

        def name
          :link
        end

        def value
          @final_value = nil

          @value.each_character_with_index_from(@start_at + 2) do |chr2, index2|
            next unless @value[index2..(index2 + 1)] == '))'
            @final_value = @value[@start_at..(index2 + 1)]
            @skip_lines_until = index2 + 1
            break
          end

          @final_value
        end

        def attributes
          link_text = @final_value.match(/^\(\[(?<link_text>.*)\]/)['link_text']
          link_href = @final_value.match(/\((?<link>(http|https).*)\)/)['link'].gsub(")", "")

          { text: link_text, href: link_href, value: nil }
        end
      end
    end
  end
end

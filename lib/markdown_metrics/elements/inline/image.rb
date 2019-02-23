# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class Image < MarkdownMetrics::Elements::Base
        def self.match_element(line, next_line)
          line.to_s.match(/^\!\[.*\)$/)
        end

        def name
          :image
        end

        def value
          current_line.match(/\((?<image>.*)\)$/)['image']
        end

        def attributes
          { alt: current_line.match(/\[(?<alt>.*)\]/)['alt'] }
        end
      end
    end
  end
end

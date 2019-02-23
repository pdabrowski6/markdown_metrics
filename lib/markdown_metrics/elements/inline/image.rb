# frozen_string_literal: true

module MarkdownMetrics
  module Elements
    module Inline
      class Image
        def self.matching_rule
          /^\!\[.*\)$/
        end

        def self.element_name
          :image
        end

        def self.value(line)
          line.match(/\((?<image>.*)\)$/)['image']
        end

        def self.attributes(line)
          { alt: line.match(/\[(?<alt>.*)\]/)['alt'] }
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'extensions/string'
require 'extensions/array'

require 'markdown_metrics/elements/base'

require 'markdown_metrics/elements/inline/h1'
require 'markdown_metrics/elements/inline/h2'
require 'markdown_metrics/elements/inline/h3'
require 'markdown_metrics/elements/inline/h4'
require 'markdown_metrics/elements/inline/h5'
require 'markdown_metrics/elements/inline/h6'
require 'markdown_metrics/elements/inline/image'
require 'markdown_metrics/elements/inline/pre'
require 'markdown_metrics/elements/inline/empty_line'
require 'markdown_metrics/elements/inline/paragraph'

require 'markdown_metrics/elements/block/table'
require 'markdown_metrics/elements/block/pre'
require 'markdown_metrics/elements/block/quote'
require 'markdown_metrics/elements/block/list'

require 'markdown_metrics/file_lines'
require 'markdown_metrics/line_top_element'
require 'markdown_metrics/top_elements_parser'


module MarkdownMetrics

end

# frozen_string_literal: true

module MarkdownMetrics
  class FileLines
    def self.from(file_path)
      content = File.open(file_path).read
      content.split("\n")
    end
  end
end

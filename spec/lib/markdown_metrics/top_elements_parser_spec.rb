require 'spec_helper'

RSpec.describe MarkdownMetrics::TopElementsParser do
  let(:lines) do
    [
      "# Main header",
      "paragraph",
      "## Header level 2",
      "### Header level 3",
      "#### Header level 4",
      "##### Header level 5",
      "###### Header level 6",
      "![desc](image)",
      "    gem install",
      ""
    ]
  end

  let(:parser) { described_class.new(lines) }

  describe '#parse' do
    it 'returns structure tree for the top elements' do
      parser.parse

      expect(parser.elements).to eq([
        { name: :h1, value: 'Main header' },
        { name: :paragraph, value: 'paragraph' },
        { name: :h2, value: 'Header level 2' },
        { name: :h3, value: 'Header level 3' },
        { name: :h4, value: 'Header level 4' },
        { name: :h5, value: 'Header level 5' },
        { name: :h6, value: 'Header level 6' },
        { name: :image, value: 'image', alt: 'desc' },
        { name: :pre, value: 'gem install' },
        { name: :empty_line, value: nil }
      ])
    end
  end
end

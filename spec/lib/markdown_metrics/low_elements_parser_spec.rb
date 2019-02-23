require 'spec_helper'

RSpec.describe MarkdownMetrics::LowElementsParser do
  describe '#parse' do
    let(:value) { "Some text **bold** and `code` now. Also *italic* is supported. Check ([link](http://google.pl)) also." }
    let(:parser) { described_class.new(value: value) }

    it 'returns string elements' do
      parser.parse

      expect(parser.elements).to eq([
        { name: :text, value: "Some text " },
        { name: :bold, value: 'bold' },
        { name: :text, value: ' and ' },
        { name: :code, value: 'code' },
        { name: :text, value: ' now. Also ' },
        { name: :italic, value: 'italic' },
        { name: :text, value: ' is supported. Check ' },
        { name: :link, value: nil, text: 'link', href: 'http://google.pl' },
        { name: :text, value: ' also.' }
      ])
    end
  end
end

require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Block::List do
  let(:lines) do
    [
      '* First item',
      '* Second item',
      '* Third item',
    ]
  end

  let(:element) { described_class.new(lines: lines, start_at: 0) }

  describe '.match_element' do
    [
      ['* First item', '* Second element'],
      ['- First item', '- Second element'],
      ['1. First element', '2. Second element']
    ].each do |lines|
      it { expect(described_class.match_element(lines.first, lines.last)).not_to be_nil }
    end
  end

  describe '#name' do
    it { expect(element.name).to eq(:list) }
  end

  describe '#value' do
    it 'returns value' do
      expect(element.value).to eq([' First item', ' Second item', ' Third item'])
    end

    it 'sets the number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(2)
    end
  end

  describe '#attributes' do
    it 'returns dash type' do
      element = described_class.new(lines: ['- item'], start_at: 0)

      expect(element.attributes).to eq({ type: :dash })
    end

    it 'returns star type' do
      element = described_class.new(lines: ['* item'], start_at: 0)

      expect(element.attributes).to eq({ type: :star })
    end

    it 'returns number type' do
      element = described_class.new(lines: ['1. item'], start_at: 0)

      expect(element.attributes).to eq({ type: :number })
    end
  end
end

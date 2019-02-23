require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Block::Quote do
  let(:line) { '> Some quote' }
  let(:next_line) { '> Author' }
  let(:element) { described_class.new(lines: [line, next_line], start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element(line, next_line)).not_to be_nil }
  end

  describe '#name' do
    it { expect(element.name).to eq(:quote) }
  end

  describe '#value' do
    let(:lines) do
      [
        '>Some quote',
        '>',
        '>Author',
      ]
    end

    let(:element) { described_class.new(lines: lines, start_at: 0) }

    it 'returns value' do
      expect(element.value).to eq(['Some quote', '', 'Author'])
    end

    it 'sets the number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(2)
    end
  end
end

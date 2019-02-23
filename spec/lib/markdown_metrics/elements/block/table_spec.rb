require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Block::Table do
  let(:line) { 'Header | Header' }
  let(:next_line) { '------ | -----' }
  let(:element) { described_class.new(lines: [line, next_line], start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element(line, next_line)).not_to be_nil }
  end

  describe '#name' do
    it { expect(element.name).to eq(:table) }
  end

  describe '#value' do
    let(:lines) do
      [
        'Header | Header',
        '------ | -----',
        'value | value1',
        'value2 | value3'
      ]
    end

    let(:element) { described_class.new(lines: lines, start_at: 0) }

    it 'returns table values' do
      expect(element.value).to eq({
        headers: ['Header ', ' Header'],
        rows: [
          ['value ', ' value1'],
          ['value2 ', ' value3']
        ]
      })
    end

    it 'sets the number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(3)
    end
  end
end

require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Sentence::Text do
  let(:value) { 'text *italic*' }
  let(:element) { described_class.new(value: value, start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element('', '')).to eq(true) }
  end

  describe '#name' do
    it { expect(element.name).to eq(:text) }
  end

  describe '#value' do
    it { expect(element.value).to eq('text ') }

    it 'sets number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(4)
    end
  end
end

require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Sentence::Italic do
  let(:value) { '*italic* text' }
  let(:element) { described_class.new(value: value, start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element('*', 'i')).to eq(true) }
  end

  describe '#name' do
    it { expect(element.name).to eq(:italic) }
  end

  describe '#value' do
    it { expect(element.value).to eq('italic') }

    it 'sets number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(7)
    end
  end
end

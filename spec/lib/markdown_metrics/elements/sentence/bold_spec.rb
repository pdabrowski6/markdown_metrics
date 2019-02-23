require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Sentence::Bold do
  let(:value) { '**bold** text' }
  let(:element) { described_class.new(value: value, start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element('*', '*')).to eq(true) }
  end

  describe '#name' do
    it { expect(element.name).to eq(:bold) }
  end

  describe '#value' do
    it { expect(element.value).to eq('bold') }

    it 'sets number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(7)
    end
  end
end

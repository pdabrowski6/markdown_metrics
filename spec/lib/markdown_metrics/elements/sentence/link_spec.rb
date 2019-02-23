require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Sentence::Link do
  let(:value) { '([link](http://google.pl)) text' }
  let(:element) { described_class.new(value: value, start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element('(', '[')).to eq(true) }
  end

  describe '#value' do
    it { expect(element.value).to eq('([link](http://google.pl))') }

    it 'sets number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(25)
    end
  end

  describe '#attributes' do
    it 'returns attributes' do
      element.value

      expect(element.attributes).to eq({ text: 'link', href: 'http://google.pl', value: nil })
    end
  end
end

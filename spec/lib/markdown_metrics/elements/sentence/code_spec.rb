require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Sentence::Code do
  let(:value) { '`code` text' }
  let(:element) { described_class.new(value: value, start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element('`', nil)).to eq(true) }
  end

  describe '#name' do
    it { expect(element.name).to eq(:code) }
  end

  describe '#value' do
    it { expect(element.value).to eq('code') }

    it 'sets number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(5)
    end
  end
end

require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::Image do
  let(:line) { "![image_desc](http://url.com/image)" }
  let(:next_line) { nil }
  let(:element) { described_class.new(lines: [line, next_line], start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element(line, next_line)).not_to be_nil }
  end

  describe '#name' do
    it { expect(element.name).to eq(:image) }
  end

  describe '#value' do
    it { expect(element.value).to eq('http://url.com/image') }
  end

  describe '.attributes' do
    it 'returns alt attribute' do
      expect(described_class.attributes(line)).to eq({ alt: 'image_desc' })
    end
  end
end

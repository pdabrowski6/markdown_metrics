require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::Image do
  let(:line) { "![image_desc](http://url.com/image)" }

  describe '.matching_rule' do
    it { expect(line.match(described_class.matching_rule)).not_to be_nil }
  end

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:image) }
  end

  describe '.value' do
    it { expect(described_class.value(line)).to eq('http://url.com/image') }
  end

  describe '.attributes' do
    it 'returns alt attribute' do
      expect(described_class.attributes(line)).to eq({ alt: 'image_desc' })
    end
  end
end

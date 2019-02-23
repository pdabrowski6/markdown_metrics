require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::EmptyLine do
  let(:line) { '' }
  let(:next_line) { nil }

  describe '.match_element' do
    it { expect(described_class.match_element(line, next_line)).not_to be_nil }
  end

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:empty_line) }
  end

  describe '.value' do
    it { expect(described_class.value(line)).to be_nil }
  end
end

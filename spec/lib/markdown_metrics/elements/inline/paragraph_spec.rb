require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::Paragraph do
  let(:line) { "Lorem ipsum" }

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:paragraph) }
  end

  describe '.value' do
    it { expect(described_class.value(line)).to eq('Lorem ipsum') }
  end
end

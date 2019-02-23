require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::H3 do
  let(:line) { "### header" }
  let(:next_line) { nil }

  describe '.match' do
    it { expect(described_class.match(line, next_line)).not_to be_nil }
  end

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:h3) }
  end

  describe '.value' do
    it { expect(described_class.value(line)).to eq('header') }
  end
end

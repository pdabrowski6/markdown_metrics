require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::H2 do
  let(:line) { "## header" }

  describe '.matching_rule' do
    it { expect(line.match(described_class.matching_rule)).not_to be_nil }
  end

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:h2) }
  end

  describe '.value' do
    it { expect(described_class.value(line)).to eq('header') }
  end
end

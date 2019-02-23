require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::Pre do
  let(:line) { "    gem install markdown_metrics" }

  describe '.matching_rule' do
    it { expect(line.match(described_class.matching_rule)).not_to be_nil }
  end

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:pre) }
  end

  describe '.value' do
    it { expect(described_class.value(line)).to eq('gem install markdown_metrics') }
  end
end
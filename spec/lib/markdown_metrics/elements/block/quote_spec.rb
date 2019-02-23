require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Block::Quote do
  let(:line) { '> Some quote' }
  let(:next_line) { '> Author' }

  describe '.match_element' do
    it { expect(described_class.match_element(line, next_line)).not_to be_nil }
  end

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:quote) }
  end
end

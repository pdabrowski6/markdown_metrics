require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Block::List do
  describe '.match_element' do
    [
      ['* First item', '* Second element'],
      ['- First item', '- Second element'],
      ['1. First element', '2. Second element']
    ].each do |lines|
      it { expect(described_class.match_element(lines.first, lines.last)).not_to be_nil }
    end
  end

  describe '.element_name' do
    it { expect(described_class.element_name).to eq(:list) }
  end
end

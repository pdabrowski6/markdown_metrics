require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Inline::Paragraph do
  let(:line) { "Lorem ipsum" }
  let(:next_line) { nil }
  let(:element) { described_class.new(lines: [line, next_line], start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element(line, next_line)).not_to be_nil }
  end

  describe '#name' do
    it { expect(element.name).to eq(:paragraph) }
  end

  describe '#value' do
    it { expect(element.value).to eq('Lorem ipsum') }
  end
end

require 'spec_helper'

RSpec.describe MarkdownMetrics::Elements::Block::Pre do
  let(:line) { '```ruby' }
  let(:next_line) { 'class Some' }
  let(:element) { described_class.new(lines: [line, next_line], start_at: 0) }

  describe '.match_element' do
    it { expect(described_class.match_element(line, next_line)).not_to be_nil }
  end

  describe '#name' do
    it { expect(element.name).to eq(:pre) }
  end

  describe '#value' do
    let(:lines) do
      [
        '```ruby',
        'class Something',
        'end',
        '```'
      ]
    end

    let(:element) { described_class.new(lines: lines, start_at: 0) }

    it 'returns value' do
      expect(element.value).to eq("class Something\nend")
    end

    it 'sets the number of lines to skip' do
      element.value

      expect(element.skip_lines_until).to eq(3)
    end
  end

  describe '#attributes' do
    let(:lines) do
      [
        '```ruby',
        'class Something',
        'end',
        '```'
      ]
    end

    let(:element) { described_class.new(lines: lines, start_at: 0) }

    it 'returns language name' do
      expect(element.attributes).to eq({ language: 'ruby' })
    end
  end
end

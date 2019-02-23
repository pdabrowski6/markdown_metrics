require 'spec_helper'

RSpec.describe MarkdownMetrics::FileLines do
  describe '.from' do
    let(:file_path) { "#{Dir.pwd}/spec/fixtures/file.md" }
    let(:lines) { described_class.from(file_path) }

    it 'returns array of lines pulled from file from the given path' do
      expect(lines.size).to eq(3)

      expect(lines[0]).to eq('# Header')
      expect(lines[1]).to eq('')
      expect(lines[2]).to eq('content')
    end
  end
end

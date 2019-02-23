require 'spec_helper'

RSpec.describe MarkdownMetrics::LineLowElement do
  describe '.match_element' do
    it { 
      expect(
        described_class.match_element('*', '*')
      ).to eq(MarkdownMetrics::Elements::Sentence::Bold)
    }

    it { 
      expect(
        described_class.match_element('`', 'c')
      ).to eq(MarkdownMetrics::Elements::Sentence::Code)
    }

    it { 
      expect(
        described_class.match_element('*', 'i')
      ).to eq(MarkdownMetrics::Elements::Sentence::Italic)
    }

    it { 
      expect(
        described_class.match_element('(', '[')
      ).to eq(MarkdownMetrics::Elements::Sentence::Link)
    }

    it { 
      expect(
        described_class.match_element('t', 'e')
      ).to eq(MarkdownMetrics::Elements::Sentence::Text)
    }
  end
end

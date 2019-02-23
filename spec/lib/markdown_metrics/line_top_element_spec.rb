require 'spec_helper'

RSpec.describe MarkdownMetrics::LineTopElement do
  describe '.match_element' do
    it { 
      expect(
        described_class.match_element('# header', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::H1)
    }

    it { 
      expect(
        described_class.match_element('## header', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::H2)
    }

    it { 
      expect(
        described_class.match_element('### header', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::H3)
    }

    it { 
      expect(
        described_class.match_element('#### header', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::H4)
    }

    it { 
      expect(
        described_class.match_element('##### header', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::H5)
    }

    it { 
      expect(
        described_class.match_element('###### header', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::H6)
    }

    it { 
      expect(
        described_class.match_element('    gem install', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::Pre)
    }

    it { 
      expect(
        described_class.match_element(nil, nil)
      ).to eq(MarkdownMetrics::Elements::Inline::EmptyLine)
    }

    it { 
      expect(
        described_class.match_element('![picture](url)', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::Image)
    }

    it { 
      expect(
        described_class.match_element('Lorem ipsum', nil)
      ).to eq(MarkdownMetrics::Elements::Inline::Paragraph)
    }
  end
end

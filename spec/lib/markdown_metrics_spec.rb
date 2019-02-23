require 'spec_helper'

RSpec.describe MarkdownMetrics do
  describe '.generate' do
    subject { described_class.generate(file_path: file_path) }

    let(:file_path) { 'fake_path' }
    let(:markdown_lines) do
      [
        '# Main header',
        '',
        'Paragraph 1',
        '',
        'Paragraph with **bold** fragment',
        'Paragraph with *italic* and `code` in one line ([link](https://google.com))',
        '* List item 1',
        '* List item with **bold**',
        '* List item 3',
        '',
        '```ruby',
        'class Something',
        'end',
        '```',
        '',
        '>Quote',
        '>',
        '>**Author**',
        '',
        'Header | Header2',
        '---- | ----',
        'Value 1 | Value **2**',
        '![image alt](https://url.com/image)',
        '    gem install',
        '# Header with *italic*',
        '## header 2',
        '### header 3',
        '#### header 4',
        '##### header 5',
        '###### header 6',
        'Paragraph (1)'
      ]
    end

    before do
      allow(MarkdownMetrics::FileLines).to receive(:from).with(
        file_path
      ).and_return(markdown_lines)
    end

    it 'generates markdown metrics' do
      expect(subject).to eq([
        { name: :h1, value: [
          { name: :text, value: 'Main header' }
        ]},
        { name: :empty_line, value: nil },
        { name: :paragraph, value: [
          { name: :text, value: 'Paragraph 1' }
        ] },
        { name: :empty_line, value: nil },
        { name: :paragraph, value: [
          { name: :text, value: 'Paragraph with ' },
          { name: :bold, value: 'bold' },
          { name: :text, value: ' fragment' }
        ]},
        { name: :paragraph, value: [
          { name: :text, value: 'Paragraph with ' },
          { name: :italic, value: 'italic' },
          { name: :text, value: ' and ' },
          { name: :code, value: 'code' },
          { name: :text, value: ' in one line ' },
          { name: :link, value: nil, href: 'https://google.com', text: 'link' }
        ]},
        { name: :list, type: :star, value: [
          [{ name: :text, value: ' List item 1' }], 
          [
            { name: :text, value: ' List item with ' },
            { name: :bold, value: 'bold' }
          ], 
          [{ name: :text, value: ' List item 3' }]
        ]},
        { name: :empty_line, value: nil },
        { name: :pre, language: 'ruby', value: "class Something\nend" },
        { name: :empty_line, value: nil },
        { name: :quote, value: [
          [ { name: :text, value: 'Quote' }],
          [],
          [ { name: :bold, value: 'Author' }]
        ] },
        { name: :empty_line, value: nil },
        { name: :table, value: { headers: ['Header ', ' Header2'], rows: [
          [
            [{ name: :text, value: 'Value 1 ' }], 
            [{ name: :text, value: ' Value ' }, { name: :bold, value: '2' }]
          ]
        ] } },
        { name: :image, value: 'https://url.com/image', alt: 'image alt' },
        { name: :pre, value: 'gem install' },
        { name: :h1, value: [
          { name: :text, value: 'Header with ' },
          { name: :italic, value: 'italic' }
        ]},
        { name: :h2, value: [
          { name: :text, value: 'header 2' }
        ]},
        { name: :h3, value: [
          { name: :text, value: 'header 3' }
        ]},
        { name: :h4, value: [
          { name: :text, value: 'header 4' }
        ]},
        { name: :h5, value: [
          { name: :text, value: 'header 5' }
        ]},
        { name: :h6, value: [
          { name: :text, value: 'header 6' }
        ]},
        { name: :paragraph, value: [
          { name: :text, value: 'Paragraph (1)' }
        ] },
      ])
    end
  end
end

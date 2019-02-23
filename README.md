# Markdown Metrics

`MarkdownMetrics` is a library for the markdown document structure tree generation. Generated structure can be used then to translate markdown document to any other format like PDF or HTML.

## Usage

Just give it a file path to the markdown document:

```ruby
MarkdownMetrics.generate(file_path: 'file.md')
```

## Not supported elements

Currently, not all elements are supported. The following elements are not:

* Nested lists
* One string with multiple formatting like word that is bolded and linked
* Underlined text

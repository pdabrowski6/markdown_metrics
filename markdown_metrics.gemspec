lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'markdown_metrics/version'

Gem::Specification.new do |s|
  s.add_development_dependency "rspec", '~> 3.7', '>= 3.7.0'
  s.add_development_dependency 'pry'
  s.name        = 'markdown_metrics'
  s.version     = MarkdownMetrics::Version
  s.date        = '2019-02-23'
  s.summary     = "Analyze markdown document"
  s.description = "Analyze markdown document"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'dziamber@gmail.com'
  s.files       = Dir['lib/**/*.rb', 'spec/helper.rb']
end

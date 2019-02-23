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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
end

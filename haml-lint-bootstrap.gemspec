require './lib/haml_lint/bootstrap/version'

Gem::Specification.new do |s|
  s.name          = "haml-lint-bootstrap"
  s.version       = HamlLint::Bootstrap::VERSION
  s.authors       = ["Takuya Noguchi"]
  s.email         = ["takninnovationresearch@gmail.com"]

  s.summary       = %q{A HAML-Lint plugin for Bootstrap}
  s.description   = %q{A simple HAML-Lint plugin used for linting HAML files utilizing Bootstrap. Supported Bootstrap version is 4.5 and 5.0 alpha.}
  s.homepage      = "https://github.com/tnir/haml-lint-bootstrap"
  s.license       = "MIT"
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/tnir/stub-haml-lint-bootstrap"
  s.metadata["changelog_uri"] = "https://github.com/tnir/stub-haml-lint-bootstrap"

  s.add_runtime_dependency 'haml_lint', '~> 0.36', '>= 0.36.0'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.0'

  s.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|\.github|Gemfile|\.rspec)/}) }
  end
  s.require_paths = ["lib"]
end

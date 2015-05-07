# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kaseifu/version'

Gem::Specification.new do |spec|
  spec.name          = 'kaseifu'
  spec.version       = Kaseifu::VERSION
  spec.authors       = ['Takeshi Takizawa']
  spec.email         = ['takitake.create@gmail.com']

  spec.summary       = 'Additional helper methods of ActionView.'
  spec.description   = 'This gem provide some useful helper methods for Application which use ActionView.'
  spec.homepage      = 'https://github.com/TakiTake/kaseifu'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 3.0'
  spec.add_dependency 'actionpack', '~> 3.0'
  spec.add_dependency 'railties', '~> 3.0'

  spec.add_development_dependency 'bundler', '>= 1.6.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rails', '~> 3.0'
  spec.add_development_dependency 'rspec-rails'
end

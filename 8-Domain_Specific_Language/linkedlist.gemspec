# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'linkedlist/version'

Gem::Specification.new do |spec|
  spec.name          = 'Referencias_Bibliograficas_APA'
  spec.version       = Linkedlist::VERSION
  spec.authors       = ['Adrián Rodríguez-Bazaga']
  spec.email         = ['arodriba@ull.edu.es']

  spec.summary       = 'Definicion sencilla de referencias.'
  spec.description   = 'Gema para definidir de forma sencilla referencias bibliograficas en formato APA.'
  spec.homepage      = "https://github.com/AdrianBZG/LPP-prct11"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4.0'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-bundler'
end

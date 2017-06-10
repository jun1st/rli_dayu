# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rli_dayu/version'

Gem::Specification.new do |spec|
  spec.name          = 'rli_dayu'
  spec.version       = RliDayu::VERSION
  spec.authors       = ['fengqijun']
  spec.email         = ['jun1st.feng@gmail.com']

  spec.summary       = 'send short massage use alidayu service'
  spec.description   = 'send short massage use alidayu service'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

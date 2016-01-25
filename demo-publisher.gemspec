# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'demo-publisher/version'
Gem::Specification.new do |s|
  s.name = 'demo-publisher'
  s.version = DemoPublisher::VERSION
  s.authors = ['Christoph Lukas', 'Alexander Birk']
  s.email = ['info@pingworks.de']
  s.homepage = ''
  s.summary = 'Demo Publisher'
  s.description = 'Demo Publisher'
  s.rubyforge_project = 'demo-publisher'
  s.files = `git ls-files`.split('\n')
  s.test_files = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables = `git ls-files -- bin/*`.split('\n').map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_runtime_dependency 'bunny'
  s.add_runtime_dependency 'logstash-logger'
end

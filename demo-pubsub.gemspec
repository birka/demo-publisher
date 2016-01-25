# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'demo-pubsub/version'
Gem::Specification.new do |s|
  s.name = 'demo-pubsub'
  s.version = DemoPublisher::VERSION
  s.authors = ['Christoph Lukas', 'Alexander Birk']
  s.email = ['info@pingworks.de']
  s.homepage = ''
  s.summary = 'Demo Pubsub'
  s.description = 'Demo Pubsub'
  s.rubyforge_project = 'demo-pubsub'
  s.files = `git ls-files`.split('\n')
  s.test_files = `git ls-files -- {test,spec,features}/*`.split('\n')
  s.executables = `git ls-files -- bin/*`.split('\n').map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_runtime_dependency 'bunny'
  s.add_runtime_dependency 'logstash-logger'
end

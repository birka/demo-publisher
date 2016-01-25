#!/usr/bin/env ruby
# encoding: utf-8

require 'bunny'
require 'logstash-logger'

logger = LogStashLogger.new(
  type: :file,
  path: '/tmp/emmitter.log',
  sync: true,
  formatter: ::Logger::Formatter)

logger.info 'opening connection to rabbitmq on localhost:5672 as user guest'

conn = Bunny.new(
  host: 'localhost',
  vhost: '/demo',
  port: 5672,
  user: 'demo',
  password: 'demo')

conn.start

ch   = conn.create_channel
x    = ch.fanout('logs')

msg  = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')

logger.info "publishing message #{msg} to exchange..."

x.publish(msg)
puts " [x] Sent #{msg}"

conn.close

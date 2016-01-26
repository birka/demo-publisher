#!/usr/bin/env ruby
# encoding: utf-8

require 'bunny'
require 'logstash-logger'
require 'couchrest'

logger = LogStashLogger.new(
  type: :file,
  path: '/tmp/emmitter.log',
  sync: true,
  formatter: ::Logger::Formatter)

logger.info 'opening connection to rabbitmq on localhost:5672 as user guest'

server = CouchRest.new           # assumes localhost by default!
db = server.database!('testdb')  # create db if it doesn't already exist

conn = Bunny.new(
  host: 'localhost',
  vhost: '/demo',
  port: 5672,
  user: 'demo',
  password: 'demo')

conn.start

ch  = conn.create_channel
x   = ch.fanout('logs')
q   = ch.queue('', exclusive: true)

q.bind(x)

puts ' [*] Waiting for logs. To exit press CTRL+C'

begin
  q.subscribe(block: true) do |_delivery_info, _properties, body|

    logger.info "receive_into_couchdb: received #{body}!"
    time = Time.new
    db.save_doc('msg' => body, 'timestamp' => time.inspect)
    puts " [x] received: #{body}"
  end
rescue Interrupt => _
  ch.close
  conn.close
end

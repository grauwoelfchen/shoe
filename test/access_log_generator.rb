#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$: << File.expand_path('/var/www/shoe/src', File.dirname(__FILE__))

require 'rubygems'
require 'drb'
require 'util/shoeconfig'

class RequestStub
end
class AccessLogGenerator
  def initialize
		@admin_threads = ThreadGroup.new
    req = RequestStub.new
    @request = DRb.start_service('druby://localhost:0', req)
    @server  = DRbObject.new(nil, SHOE::SERVER_URI)
  end
  def generate()
    result = ''
	  result.extend(DRb::DRbUndumped)
    size = 200
    if (size < 100)
      puts "at least, create 100 articles before test."
      exit
    end
    puts "generating access_log"
    r = Random.new(Time.now.to_i)
    pos = r.rand(size - 99)
    length = 100
    input = <<SRC
    agents = [
      "bot",
      "crawler",
      "spider",
      "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:10.0.2) Gecko/20100101 Firefox/10.0.2",
      "Mozilla/5.0 (iPhone; CPU iPhone OS 5_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9B176 Safari/7534.48.3"
    ]
    File.open('test/log/access_log', 'w') do |f|
      #{length}.times do |n|
        article = articles.values[#{pos} + n]
        lang = 'de'
        if n.odd?
          lang = 'en'
        end
        flavors = ['plain', 'grid']
        flavor  = flavors[rand(0..1)]
        path = "/" + lang + "/"+ flavor + "/home"
        f.puts "\\"GET " + path + " HTTP/1.1\\"  200 0 \\"http://#{SHOE::SERVER_NAME}" + path + "\\" " + "\\"\#\{agents[rand(0..agents.count)]\}\\""
        path = "/" + lang + "/" + flavor + "/slip/slug/%s" % article.slug
        f.puts "\\"GET " + path + " HTTP/1.1\\"  200 0 \\"http://#{SHOE::SERVER_NAME}" + path + "\\" " + "\\"\#\{agents[rand(0..agents.count)]\}\\""
      end
    end
SRC
    $current = @server._admin(input, result)
    $current.join
    $stdout.puts result
  end
end

generator = AccessLogGenerator.new
generator.generate

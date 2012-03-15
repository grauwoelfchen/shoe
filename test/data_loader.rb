#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

$: << File.expand_path('/var/www/shoe/src', File.dirname(__FILE__))

require 'rubygems'
require 'drb'
require 'util/shoeconfig'

class RequestStub
end
class DataLoader
  def initialize
		@admin_threads = ThreadGroup.new
    req = RequestStub.new
    @request = DRb.start_service('druby://localhost:0', req)
    @app = DRbObject.new(nil, SHOE::SERVER_URI)
  end
  def load(length=10)
    STDOUT.puts "length? "
    c = STDIN.gets.chomp.to_i
    length = c unless c.zero?
    puts "preparing ..."
    @app.articles
    puts "start data loading"
	  result = ''
	  result.extend(DRb::DRbUndumped)
    input = <<SRC
    #{length}.times do |n|
      article = create_article 
      article.title       = 'test_' + n.to_s + '_' + Time.now.to_i.to_s
      article.description = 'lorem ipsum ' * 10
    end
    articles.odba_store
    "total: " + articles.length.to_s
SRC
    $current = @app._admin(input, result)
    $current.join
    $stdout.puts result
  end
end

loader = DataLoader.new
loader.load(10)

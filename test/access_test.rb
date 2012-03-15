#!/usr/bin/env ruby
# encoding: utf-8
$: << File.expand_path('/var/www/shoe/src', File.dirname(__FILE__))

require 'mechanize'
require 'util/shoeconfig'

agent = Mechanize.new
agent.user_agent = "\
Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; de-de) \
AppleWebKit/525.18 (KHTML, like Gecko) \
Version/3.1.2 Safari/525.22"
urls = [
  "/",
  "/de/plain/",
  "/en/plain/",
  "/de/grid/",
  "/en/grid/",
]
urls.shuffle!
urls.length.times do |i|
  url = 'http://' + SHOE::SERVER_NAME + urls[i]
  print "url = #{url}, agent = #{agent.user_agent}\n"
  agent.get(url)
  sleep 1
end

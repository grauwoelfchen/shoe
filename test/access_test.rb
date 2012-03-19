#!/usr/bin/env ruby
# encoding: utf-8
$: << File.expand_path('/var/www/shoe/src', File.dirname(__FILE__))

require 'mechanize'
require 'util/shoeconfig'


input = ARGV[0] || File.dirname(__FILE__) + '/log/access_log'
agent_urls = []
File.readlines(input).each do |line|
  agent = line.split(/"/)
  agent.pop
  agent = agent.pop
  if line =~ /GET (.+) HTTP/ and agent
    agent_urls << ["http://" + SHOE::SERVER_NAME + $1, agent]
  end
end

agent = Mechanize.new
x = rand(agent_urls.length - 20)
10.times do |i|
  url = agent_urls[x+i][0]
  agent.user_agent = agent_urls[x+i][1]
  print "url = #{url}, agent = #{agent.user_agent}\n"
  page = agent.get(url)
  sleep 1
end

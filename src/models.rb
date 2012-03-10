#!/usr/bin/env ruby
# encoding: utf-8

dir = File.expand_path('model', File.dirname(__FILE__))
Dir.foreach(dir) { |filename|
	require('model/' + filename) if /\.rb$/u.match(filename)
}

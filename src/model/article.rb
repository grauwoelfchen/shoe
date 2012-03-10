#!/usr/bin/env ruby
# encoding: utf-8

require 'util/persistence'

module SHOE
	class Article
		include Persistence
		attr_accessor :slug, :title, :descriptiono,
      :created_at, :updated_at
	end
end

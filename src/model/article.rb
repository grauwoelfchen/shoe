#!/usr/bin/env ruby
# encoding: utf-8

require 'util/persistence'

module SHOE
	class Article
		include Persistence
		attr_accessor \
      :slug, :title, :description,
      :created_at, :updated_at
    def initialize
      @created_at = @updated_at = Time.now
    end
	end
end

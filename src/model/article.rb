#!/usr/bin/env ruby
# encoding: utf-8

require 'util/persistence'

module SHOE
	class Article
		include Persistence
    include ODBA::Persistable
    attr_reader :slug
		attr_accessor \
      :title, :description,
      :created_at, :updated_at
    odba_index :slug
    def initialize
      @slug = _slug
      @created_at = @updated_at = Time.now
      super
    end
    private
    def _slug
      src = [('0'..'9'),('a'..'z')].map{ |r| r.to_a }.flatten
      begin
        slug = (0..8).map{ src[rand(src.length)] }.join
      end
      slug
    end
	end
end

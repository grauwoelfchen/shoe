#!/usr/bin/env ruby
# encoding: utf-8

require 'view/partial/navigationlink'

module SHOE
	module View
    class FlavorNavigationLink < NavigationLink
			def init
				super
				flavor = @session.flavor
				unless(flavor == @name.to_s)
					path = @session.request_path.dup
					path.slice!(/\/$/u)
          base = "/#{@name}/"
					path.sub!(%r{/#{flavor}/?}u, base) \
            || path = '/' + @session.language + '/' + @name.to_s
					@attributes.store("href", path)
				end
			end
		end
	end
end

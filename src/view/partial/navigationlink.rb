#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/link'

module SHOE
	module View
		class NavigationLink < HtmlGrid::Link
			CSS_CLASS = "navigation"
			def init
				super
				unless(@lookandfeel.direct_event == @name)
					@attributes.store("href", @lookandfeel._event_url(@name))
				end
			end
		end
	end
end

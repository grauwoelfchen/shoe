#!/usr/bin/env ruby
# encoding: utf-8

require 'view/partial/navigationlink'

module SHOE
	module View
    class SlipNavigationLink < NavigationLink
			CSS_CLASS = 'pages'
			def init
				super
				unless(@lookandfeel.direct_event == @name)
					@attributes.store("href", @lookandfeel._event_url(@name))
				end
			end
		end
	end
end

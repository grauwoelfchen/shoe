#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'

module SHOE
	module View
		class Hello < HtmlGrid::Composite
			COMPONENTS = {
				[0,0]	=>	:greet,
			}
			COMPONENT_CSS_MAP = {
				[0,0]	=>	'greet',
			}
			CSS_MAP = {
				[0,0]	=>	'',
			}
			CSS_CLASS = 'composite'
		end
	end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'
require 'htmlgrid/text'
require 'htmlgrid/link'

module SHOE
	module View
		class WelcomeHead < HtmlGrid::Composite
			CSS_CLASS = 'composite'
			CSS_MAP = {
				[0,0]	=>	'logo',
				[1,0]	=>	'welcome',
			}
			COMPONENTS = {
				[0,0]		=>	'',
				[1,0,1]	=>	:home_welcome,
				[1,0,2]	=>	:welcome,
			}
		end
	end
end

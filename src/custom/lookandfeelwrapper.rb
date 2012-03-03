#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/lookandfeelwrapper'

module SHOE
	class LookandfeelGray < SBSM::LookandfeelWrapper
		ENABLED = [
			:logo,
		]
		DICTIONARIES = {
			'de'	=>	{
				:html_title		=>	'', 
				:home_welcome	=>  "",
			},
			'en'	=>	{
				:html_title		=>	'', 
				:home_welcome	=>  "",
			}
		}
    RESOURCES = {
      :css    => 'shoe.css',
      :logo   => 'logo.png',
    }
		HTML_ATTRIBUTES = {
			:logo => {
				'width'		=> '59',
				'height'	=> '29',
			},
		}
		def navigation(filter=false)
      [:home] + [:hello] + [:goodbye]
		end
	end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/lookandfeelfactory'
require 'custom/lookandfeelbase'
require 'custom/lookandfeelwrapper'

module SHOE
	class LookandfeelFactory < SBSM::LookandfeelFactory
		BASE = LookandfeelBase
		WRAPPERS = {
      'gray' => [
        LookandfeelGray,
      ]
		}
	end
end

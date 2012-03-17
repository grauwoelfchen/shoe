#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/validator'
require 'cgi'

module SHOE
	class Validator < SBSM::Validator
		EVENTS = [
      :index,
			:slips,
			:slip,
		]
    STRINGS = [
      :slug,
    ]
	end
end

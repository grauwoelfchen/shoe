#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/validator'
require 'cgi'

module SHOE
	class Validator < SBSM::Validator
		EVENTS = [
			:hello,
			:goodbye
		]
	end
end

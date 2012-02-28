#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/validator'

module SHOE
	class Validator < SBSM::Validator
		def filename(value)
			if(value == File.basename(value))
				value
			end
		end
		def page(value)
			validate_numeric(:page, value).to_i - 1
		end
	end
end

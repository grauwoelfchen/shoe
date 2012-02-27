#!/usr/bin/env ruby
# encoding: utf-8

require 'state/global_predefine'
require 'view/home/init'

module SHOE
	module State
		module Home
class Init < State::Global
	VIEW = View::Home::Init
	DIRECT_EVENT = :home_init
end
		end
	end
end

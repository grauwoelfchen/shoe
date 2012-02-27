#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/urllink'
require 'state/home/init'
require 'sbsm/state'

module SHOE
  module State
    class Global < SBSM::State
      DIRECT_EVENT = nil 
      GLOBAL_MAP = {
        :home  => State::Home::Init,
        :hallo => State::Home::Init
      }	
      HOME_STATE = State::Home::Init
      VIEW = View::Home::Init
			def home_state
				self::class::HOME_STATE
			end
    end
	end
end

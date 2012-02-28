#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/urllink'
require 'state/greet/hello'
require 'state/greet/goodbye'
require 'sbsm/state'

module SHOE
  module State
    class Global < SBSM::State
      DIRECT_EVENT = nil 
      GLOBAL_MAP = {
        :hello   => State::Greet::Hello,
        :goodbye => State::Greet::Goodbye
      }	
      HOME_STATE = State::Greet::Hello
      VIEW       = View::Greet::Hello
    end
	end
end

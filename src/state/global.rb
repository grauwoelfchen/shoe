#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/state'
require 'state/slips/index'
require 'state/slips/show'

module SHOE
  module State
    class Global < SBSM::State
      GLOBAL_MAP = {
        :articles => State::Slips::Index,
        :article  => State::Slips::Show,
      }	
      # default
      DIRECT_EVENT = nil 
      HOME_STATE   = State::Slips::Index
      VIEW         = View::Slips::Index
    end
	end
end

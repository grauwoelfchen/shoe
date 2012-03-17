#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/state'
require 'state/slips/index'
require 'state/slips/show'

module SHOE
  module State
    class Global < SBSM::State
      GLOBAL_MAP = {
        :index => State::Slips::Index,
        :slips => State::Slips::Index,
        :slip  => State::Slips::Show,
      }	
    end
	end
end

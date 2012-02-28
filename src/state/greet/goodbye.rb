#!/usr/bin/env ruby
# encoding: utf-8

require 'state/global_predefine'
require 'view/greet/goodbye'

module SHOE
  module State
    module Greet
      class Goodbye < State::Global
        VIEW         = View::Greet::Goodbye
        DIRECT_EVENT = :goodbye
      end
    end
  end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'state/global_predefine'
require 'view/greet/hello'

module SHOE
  module State
    module Greet
      class Hello < State::Global
        VIEW         = View::Greet::Hello
        DIRECT_EVENT = :hello
      end
    end
  end
end

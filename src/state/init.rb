#!/usr/bin/env ruby
# encoding: utf-8

require 'state/global'
require 'ostruct'

module SHOE
  module State
    class Init < State::Global
      def init
        super
        startup
      end
      def startup
        @user  = @model
        @model = OpenStruct.new
      end
    end
	end
end

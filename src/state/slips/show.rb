#!/usr/bin/env ruby
# encoding: utf-8

require 'state/global_predefine'
require 'model/article'
require 'view/slips/show'

module SHOE
  module State
    module Slips
      class Show < State::Global
        VIEW         = View::Slips::Show
        DIRECT_EVENT = :show
        def show
          p "show!" 
        end
      end
    end
  end
end

#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/publictemplate'
require 'view/composite/head'
require 'view/greet/composite/greet'

module SHOE
  module View
    module Greet
      class Goodbye < View::PublicTemplate
        CSS_CLASS = 'composite'
        HEAD      = View::HeadComposite
        CONTENT   = View::Greet::GreetComposite
        COMPONENTS = {
          [0, 1] => :goodbye,
        }
        def goodbye(model, session=@session)
          "Goodby!"
        end
      end
    end 
  end 
end

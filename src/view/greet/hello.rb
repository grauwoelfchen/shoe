#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/publictemplate'
require 'view/composite/head'
require 'view/greet/composite/greet'

module SHOE
  module View
    module Greet
      class Hello < View::PublicTemplate
        CSS_CLASS = 'composite'
        HEAD      = View::HeadComposite
        CONTENT   = View::Greet::GreetComposite
        COMPONENTS = {
          [0, 1] => :hello,
        }
        def hello(model, session=@session)
          "Hello !"
        end
      end
    end 
  end 
end

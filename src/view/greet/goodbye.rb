#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/publictemplate'
require 'view/greet/composite/greet'

module SHOE
  module View
    module Greet
      class Goodbye < View::PublicTemplate
        CSS_CLASS = 'composite'
        CONTENT   = View::Greet::GreetComposite
      end
    end 
  end 
end

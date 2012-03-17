#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/template'
require 'view/slips/composite/show'

module SHOE
  module View
    module Slips
      class Show < View::Template
        CSS_CLASS = 'composite'
        CONTENT   = View::Slips::ShowComposite
      end
    end 
  end 
end

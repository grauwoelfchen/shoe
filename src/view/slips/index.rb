#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/template'
require 'view/slips/composite/index'

module SHOE
  module View
    module Slips
      class Index < View::Template
        CSS_CLASS = 'composite'
        CONTENT   = View::Slips::IndexComposite
      end
    end 
  end 
end

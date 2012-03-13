#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/publictemplate'
require 'view/slips/composite/index'

module SHOE
  module View
    module Slips
      class Index < View::PublicTemplate
        CSS_CLASS = 'composite'
        CONTENT   = View::Slips::IndexComposite
      end
    end 
  end 
end

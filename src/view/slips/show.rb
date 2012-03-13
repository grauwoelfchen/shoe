#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/publictemplate'
require 'view/slips/composite/show'

module SHOE
  module View
    module Slips
      class Show < View::PublicTemplate
        CSS_CLASS = 'composite'
        CONTENT   = View::Slips::ShowComposite
      end
    end 
  end 
end

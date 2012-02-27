#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/publictemplate'
require 'view/welcomehead'

module SHOE
  module View
    module Home
class Init < View::PublicTemplate
  CSS_CLASS = 'composite'
  HEAD = View::WelcomeHead
end
    end 
  end 
end

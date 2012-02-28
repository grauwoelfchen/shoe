#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'
require 'htmlgrid/text'

module SHOE
  module View
    class HeadComposite < HtmlGrid::Composite
      CSS_CLASS = 'composite'
      CSS_MAP = {
        [0,0]  => 'logo',
        [1,0]  => 'welcome',
      }
      COMPONENTS = {
        [0,0]   => '',
        [1,0,1] => :head
      }
      def head (model, session=@session)
        "Hey!"
      end
    end
  end
end

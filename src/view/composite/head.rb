#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'
require 'htmlgrid/text'
require 'view/partial/logo'

module SHOE
  module View
    class HeadComposite < HtmlGrid::Composite
      CSS_CLASS = 'composite'
      CSS_MAP = {
        [0,0]  => 'logo',
        [1,0]  => 'welcome',
      }
      COMPONENTS = {
        [0,0]   => View::Logo,
        [1,0,1] => :head,
      }
      def head (model, session=@session)
        parts = []
        parts.push @lookandfeel.lookup(:head_text)
      end
    end
  end
end

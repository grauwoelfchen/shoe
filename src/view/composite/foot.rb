#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'
require 'view/composite/flavor_navigation'

module SHOE
  module View
    class FootComposite < HtmlGrid::Composite
      CSS_CLASS = 'composite'
      CSS_MAP = {
        [0,0]  => 'text',
        [0,1]  => 'list',
      }
      COMPONENTS = {
        [0,0] => :foot,
        [0,1] => View::FlavorNavigationComposite,
      }
      def foot(model, session=@session)
        parts = []
        parts.push @lookandfeel.lookup(:foot_text)
      end
    end
  end
end

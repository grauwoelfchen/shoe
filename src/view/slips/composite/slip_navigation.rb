#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'view/composite/navigation'
require 'view/slips/partial/slip_navigationlink'

module SHOE
  module View  
    module Slips
      class SlipNavigationComposite < NavigationComposite
        NAV_LINK_CLASS = SlipNavigationLink
        NAV_LINK_CSS   = 'link'
        NAV_METHOD     = :slip_navigation
        def recent_index(model, session=@session)
          link = self.class::NAV_LINK_CLASS.new(:home, model, session, self)
          link.value = @lookandfeel.lookup(:article_recent_index)
          link
        end
        def all_index(model, session=@session)
          link = self.class::NAV_LINK_CLASS.new(:articles, model, session, self)
          link.value = @lookandfeel.lookup(:article_all_index)
          link
        end
      end
    end
  end
end

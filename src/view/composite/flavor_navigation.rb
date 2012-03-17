#!/usr/bin/env ruby
# encoding: utf-8

require 'view/composite/navigation'
require 'view/partial/flavor_navigationlink'

module SHOE
	module View
		class FlavorNavigationComposite < NavigationComposite
			NAV_LINK_CLASS = FlavorNavigationLink
			NAV_LINK_CSS   = 'subheading'
			NAV_METHOD     = :flavor_navigation
			def grid(model, session=@session)
        value = @lookandfeel.lookup(:pattern_grid)
        unless @session.flavor == :grid.to_s
          link = self.class::NAV_LINK_CLASS.new(:grid, model, session, self)
          link.value = value
          link
        else
          value
        end
			end
			def plain(model, session=@session)
        value = @lookandfeel.lookup(:pattern_plain)
        unless @session.flavor == :plain.to_s
          link = self.class::NAV_LINK_CLASS.new(:plain, model, session, self)
          link.value = value
          link
        else
          value
        end
			end
		end
	end
end

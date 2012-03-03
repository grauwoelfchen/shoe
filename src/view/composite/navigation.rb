#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'
require 'htmlgrid/link'
require 'htmlgrid/popuplink'
require 'view/partial/navigationlink'

module SHOE
	module View
		class NavigationComposite < HtmlGrid::Composite
			COMPONENTS = {}
			NAV_LINK_CLASS = NavigationLink
			NAV_LINK_CSS = 'subheading'
			NAV_METHOD = :navigation
			SYMBOL_MAP = {
				:navigation_divider	=>	HtmlGrid::Text,
			}
			def init
				build_navigation()
				super
			end
			def build_navigation(links = @lookandfeel.send(self::class::NAV_METHOD))
				links.each_with_index { |state, idx| 
					pos = [idx*2,0]
					if(state.is_a?(String))
						state = state.intern
					end
					component_css_map.store(pos, self::class::NAV_LINK_CSS)
					evt = if(state.is_a?(Symbol))
						unless(self.respond_to?(state))
							symbol_map.store(state, self::class::NAV_LINK_CLASS)
						end
						state
					else
						evt = state.direct_event
						symbol_map.store(evt, self::class::NAV_LINK_CLASS)
						evt
					end
					components.store(pos, evt)
					components.store([idx*2-1,0], 'navigation_divider') if idx > 0
				}
			end
			def home(model, session=@session)
				link = self.class::NAV_LINK_CLASS.new(:hello, model, session, self)
				link.value = @lookandfeel.lookup(:home_title)
				link
			end
			def hello(model, session=@session)
				link = self.class::NAV_LINK_CLASS.new(:hello, model, session, self)
				link.value = "test1"
				link
			end
			def goodbye(model, session=@session)
				link = self.class::NAV_LINK_CLASS.new(:goodbye, model, session, self)
				link.value = "test2"
				link
			end
		end
	end
end

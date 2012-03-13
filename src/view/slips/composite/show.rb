#!/usr/bin/env ruby
# encoding: utf-8

module SHOE
	module View
		module Slips
      class ShowComposite < HtmlGrid::Composite
        COMPONENTS = {
          [0,0]	=> :slug,
          [0,1]	=> :title,
          [0,2]	=> :description,
        }
        CSS_MAP = {
          [0,0]	=> 'center',
        }
        COMPONENT_CSS_MAP = {
        }
        def slug(model, session=@session)
          "test"
        end
        def title(model, session=@session)
        end
        def description(model, session=@session)
        end
      end
		end
	end
end

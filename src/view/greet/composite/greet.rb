#!/usr/bin/env ruby
# encoding: utf-8

module SHOE
	module View
		module Greet
      class GreetComposite < HtmlGrid::Composite
        COMPONENTS = {
          [0,0]	=> :greet
        }
        CSS_MAP = {
          [0,0]	=> 'list center'
        }
        COMPONENT_CSS_MAP = {}
			  def greet(model, session=@session)
				  span = super(model)
			  end
      end
		end
	end
end

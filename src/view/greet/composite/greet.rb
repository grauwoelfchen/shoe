#!/usr/bin/env ruby
# encoding: utf-8

module SHOE
	module View
		module Greet
      class GreetComposite < HtmlGrid::Composite
        COMPONENTS = {
          [0,0]	=> :context,
          [0,1]	=> :greet,
        }
        CSS_MAP = {
          [0,0]	=> 'center',
          [0,1]	=> 'center',
        }
        COMPONENT_CSS_MAP = {
        }
        def context(model, session)
          "Hey"
        end
			  def greet(model, session)
          "world!"
			  end
      end
		end
	end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/value'
require 'htmlgrid/labeltext'
require 'htmlgrid/link'

module SHOE
	module View
		module Slips
      class ShowComposite < HtmlGrid::Composite
        COMPONENTS = {
          [0,0]	=> :label_slug,
          [0,1]	=> :label_description,
          [0,2] => :label_created_at,
          [0,3] => :label_updated_at,
          [1,0]	=> :slug,
          [1,1]	=> :description,
          [1,2] => :created_at,
          [1,3] => :updated_at,
          [0,4] => :breadcrumbs,
        }
        CSS_MAP = {
          [0,0]	=> 'th label',
          [0,1]	=> 'th label',
          [0,2]	=> 'th label',
          [0,3]	=> 'th label',
          [1,0]	=> 'slug',
          [1,1]	=> 'description bg',
          [1,2]	=> 'date',
          [1,3]	=> 'date',
          [0,4] => 'navigation',
        }
        COLSPAN_MAP = {
          [0,4] => 2
        }
        DEFAULT_CLASS = HtmlGrid::Value
        SYMBOL_MAP = {
          :label_slug        => HtmlGrid::LabelText,
          :label_description => HtmlGrid::LabelText,
          :label_created_at  => HtmlGrid::LabelText,
          :label_updated_at  => HtmlGrid::LabelText,
        }
        def title(context)
          context.h2({:class => 'title'}) {
            @model.title
          }
        end
        def breadcrumbs(article, session)
          link = HtmlGrid::Link.new(:back_to_index, article, session, self)
          link.href = "/" + @session.language + "/" + @session.flavor + "/"
          link
        end
        def to_html(context)
          title(context).to_s << super
        end
      end
		end
	end
end

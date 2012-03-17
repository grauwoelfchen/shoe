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
          [0,1]	=> :label_title,
          [0,2]	=> :label_description,
          [0,3] => :label_created_at,
          [0,4] => :label_updated_at,
          [1,0]	=> :slug,
          [1,1]	=> :title,
          [1,2]	=> :description,
          [1,3] => :created_at,
          [1,4] => :updated_at,
          [0,5] => :breadcrumbs,
        }
        CSS_MAP = {
          [0,0]	=> 'label',
          [0,1]	=> 'label',
          [0,2]	=> 'label',
          [0,3]	=> 'label',
          [0,4]	=> 'label',
          [1,0]	=> 'slug',
          [1,1]	=> 'title',
          [1,2]	=> 'description bg',
          [1,3]	=> 'date',
          [1,4]	=> 'date',
          [0,5] => 'navigation',
        }
        COLSPAN_MAP = {
          [0,5] => 2
        }
        DEFAULT_CLASS = HtmlGrid::Value
        SYMBOL_MAP = {
          :label_slug        => HtmlGrid::LabelText,
          :label_title       => HtmlGrid::LabelText,
          :label_description => HtmlGrid::LabelText,
          :label_created_at  => HtmlGrid::LabelText,
          :label_updated_at  => HtmlGrid::LabelText,
        }
        def breadcrumbs(article, session)
          link = HtmlGrid::Link.new(:back_to_index, article, session, self)
          link.href = "/" + @session.language + "/" + @session.flavor + "/"
          link
        end
      end
		end
	end
end

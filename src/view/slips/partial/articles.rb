#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'htmlgrid/list'
require 'htmlgrid/link'
require 'model/article'

module SHOE
  module View
    module Slips
      class Articles < HtmlGrid::List
        DEFAULT_CLASS = HtmlGrid::Value
        SORT_REVERSE  = true
        COMPONENTS = {
          [0,0] => :title,
          [1,0] => :created_at,
        }	
        CSS_MAP    = {}
        CSS_KEYMAP = {
          :title      => 'list',
          :created_at => 'list',
        }
        CSS_CLASS          = 'composite'
        DEFAULT_HEAD_CLASS = 'heading'
        def compose_header(offset=[0,0])
          offset = super
          unless(@model.empty?)
            x, y = offset
            @grid.add('Title',    x, y)
            @grid.add_style('th', x, y)
            @grid.add('Created',  x + 1, y)
            @grid.add_style('th', x + 1, y)
            offset = resolve_offset(offset, self::class::OFFSET_STEP)
          end
          offset
        end
        def title(model, session=@session)
          link = HtmlGrid::Link.new(:title, model, session, self)
          link.href  = model.slug
          link.value = model.title
          link
        end
      end
    end
  end
end

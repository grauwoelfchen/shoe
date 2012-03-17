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
        SORT_REVERSE  = false
        COMPONENTS = {
          [0,0] => :title,
          [1,0] => :created_at,
        }	
        CSS_CLASS = 'composite'
        CSS_HEAD_MAP = {
          [0,0] => 'th left',
          [1,0] => 'th left',
        }
        CSS_MAP = {
          [0,0] => 'title list',
          [1,0] => 'created list',
        }
        BACKGROUND_SUFFIX = ' bg'
        def compose_header(offset=[0,0])
          x, y = offset
          @grid.add('Title',   x, y)
          @grid.add('Created', x + 1, y)
          super
        end
        def title(article, session)
          link = HtmlGrid::Link.new(:title, article, session, self)
          link.href  = "/" + @session.language + "/" + @session.flavor + "/slip/slug/" + article.slug
          link.value = article.title
          link
        end
      end
    end
  end
end

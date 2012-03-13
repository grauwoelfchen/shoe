#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'
require 'view/slips/partial/articles'

module SHOE
  module View
    module Slips
      class IndexComposite < HtmlGrid::Composite
        COMPONENTS = {
          [0,0] => View::Slips::Articles,
          [0,1] => :count,
        }
        CSS_CLASS = 'composite'
        CSS_MAP = {
          [0,0] => nil,
          [0,1] => 'right',
        }
        def init
          @model = @session.recent_articles
          super
        end
        def count(model, session=@session)
          @model.length
        end
        def title(context)
          context.h3 {
            @lookandfeel.lookup(:article_title)
          }
        end
        def to_html(context)
          title(context).to_s << super
        end
      end
    end
  end
end

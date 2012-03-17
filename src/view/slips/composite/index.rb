#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/composite'
require 'view/slips/composite/slip_navigation'
require 'view/slips/partial/articles'

module SHOE
  module View
    module Slips
      class IndexComposite < HtmlGrid::Composite
        COMPONENTS = {
          [0,0] => :articles,
          [0,1] => :count,
          [0,2] => View::Slips::SlipNavigationComposite,
        }
        CSS_CLASS = 'composite'
        CSS_MAP = {
          [0,0] => nil,
          [0,1] => 'right',
        }
        def title(context)
          context.h2({:class => 'center'}) {
            @lookandfeel.lookup(:article_title)
          }
        end
        def articles(model, session)
          View::Slips::Articles.new(model[:articles], session)
        end
        def count(model, session)
          model[:articles].length.to_s + ' / ' + model[:total].to_s
        end
        def to_html(context)
          title(context).to_s << super
        end
      end
    end
  end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'state/global_predefine'
require 'model/article'
require 'view/slips/index'

module SHOE
  module State
    module Slips
      class Index < State::Global
        VIEW         = View::Slips::Index
        DIRECT_EVENT = :index
        def init
          super
          @model = {
            :articles => @session.app.recent_articles,
            :total    => @session.app.articles.count
          }
        end
      end
    end
  end
end

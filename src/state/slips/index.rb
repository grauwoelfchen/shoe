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
        def articles
          articles = @session.recent_articles
          View::Slips::Index.new(articles)
        end
      end
    end
  end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'state/global_predefine'
require 'model/article'
require 'view/slips/show'

module SHOE
  module State
    module Slips
      class Show < State::Global
        VIEW         = View::Slips::Show
        DIRECT_EVENT = :show
        def init
          super
          @model = Article.find_by_slug(@session.valid_input[:slug])
        end
      end
    end
  end
end

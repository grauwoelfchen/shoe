#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/state'

module SHOE
  module State
    class Global < SBSM::State; end
    module Home
      class Global < State::Global; end
      class Init < State::Global; end
    end
  end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/lookandfeelwrapper'

module SHOE
  class LookandfeelPlain < SBSM::LookandfeelWrapper
    ENABLED = [
      :logo,
    ]
    DICTIONARIES = {
      'de' => {
        :pattern_grid  => 'Grid',
        :pattern_plain => 'Einfarbig',
      },
      'en' => {
        :pattern_grid  => 'Grid',
        :pattern_plain => 'Plain',
      },
    }
    RESOURCES    = {}
    HTML_ATTRIBUTES = {
      :logo => {
        'width'   => '59',
        'height'  => '29',
      },
    }
    def navigation(filter=false)
      [:grid] + [:plain]
    end
  end
  class LookandfeelGrid < LookandfeelPlain; end
end

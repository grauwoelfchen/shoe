#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/lookandfeel'

module SHOE
  class LookandfeelBase <  SBSM::Lookandfeel
    HTML_ATTRIBUTES = {
      :banner => {
        'width'  => '60',
        'height' => '30',
      },
    }
    RESOURCES = {
      :css    => 'shoe.css',
      :logo   => 'logo.png',
    }
    DICTIONARIES = {
      'de' => {
        :home_title         => "Home",
        :head_text          => "Das ist gute shue :-D",
        :foot_text          => "foot",
        :explain_text       => "Willkommen zu Shoe Projekt",
				:navigation_divider	=> '&nbsp;|&nbsp;',
      },
      'en' => {
        :home_title         => "Home",
        :head_text          => "It's nice shoe :-D",
        :foot_text          => "foot",
        :explain_text       => "Welcome to Shoe Project",
				:navigation_divider	=> '&nbsp;|&nbsp;',
      }
    }
  end
end

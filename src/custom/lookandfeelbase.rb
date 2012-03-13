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
    DICTIONARIES = { # a-Z
      'de' => {
        :article_title      => "Artikeln",
        :explain_text       => "Willkommen zu Shoe Projekt",
        :foot_text          => "",
        :head_text          => "Das ist gute shue :-D",
        :home_title         => "Home",
				:navigation_divider	=> '&nbsp;|&nbsp;',
      },
      'en' => {
        :article_title      => "Articles",
        :explain_text       => "Welcome to Shoe Project",
        :foot_text          => "",
        :head_text          => "It's nice shoe :-D",
        :home_title         => "Home",
				:navigation_divider	=> '&nbsp;|&nbsp;',
      }
    }
  end
end

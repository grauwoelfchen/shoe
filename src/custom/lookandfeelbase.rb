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
        :article_all_index    => "Alle Artikel",
        :article_recent_index => "Letzte Artikel",
        :article_title        => "Artikel",
        :back_to_index        => "Zrück",
        :explain_text         => "Willkommen beim Shoe Projekt",
        :foot_text            => "",
        :head_text            => "Das ist ein guter Shoe :-D",
        :home_title           => "Home",
        :label_slug           => "Slug",
        :label_title          => "Title",
        :label_description    => "Description",
        :label_created_at     => "Created",
        :label_updated_at     => "Updated",
				:navigation_divider	  => '&nbsp;|&nbsp;',
      },
      'en' => {
        :article_all_index    => "All Articles",
        :article_recent_index => "Recent Artikeln",
        :article_title        => "Articles",
        :back_to_index        => "Back",
        :explain_text         => "Welcome to the Shoe Project",
        :foot_text            => "",
        :head_text            => "This is a nice shoe :-D",
        :home_title           => "Home",
        :label_slug           => "Slug",
        :label_title          => "Title",
        :label_description    => "Description",
        :label_created_at     => "Created",
        :label_updated_at     => "Updated",
				:navigation_divider	  => '&nbsp;|&nbsp;',
      }
    }
    def navigation(filter=false)
    end
  end
end

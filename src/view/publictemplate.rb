#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/template'
require 'sbsm/time'

module SHOE
  module View
    class PublicTemplate < HtmlGrid::Template
      CONTENT    = nil
      CSS_CLASS  = "composite"
      COMPONENTS = {
        [0,0] => :head,
        [0,1] => :content,
        [0,2] => :foot,
      }
      HEAD = ''
      HTTP_HEADERS = {
        "Content-Type"  => "text/html; charset=UTF-8",
        "Cache-Control" => "private, no-store, no-cache, must-revalidate, post-check=0, pre-check=0",
        "Pragma"        => "no-cache",
        "Expires"       => Time.now.rfc1123,
        "P3P"           => "CP='OTI NID CUR OUR STP ONL UNI PRE'",
      }
      FOOT = ''
      META_TAGS = [
        {
          "name"    => "robots",
          "content" => "follow, index, noarchive",
        },
      ]
      def head(model, session)
        ""
      end
      def content(model, session)
        self::class::CONTENT.new(model, session, self)
      end
      def foot(model, session)
        "shoe"
      end
    end
  end
end

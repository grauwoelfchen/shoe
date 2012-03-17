#!/usr/bin/env ruby
# encoding: utf-8

require 'htmlgrid/template'
require 'sbsm/time'
require 'view/composite/head'
require 'view/composite/foot'

module SHOE
  module View
    class Template < HtmlGrid::Template
      HTTP_HEADERS = {
        "Content-Type"  => "text/html; charset=UTF-8",
        "Cache-Control" => "private, no-store, no-cache, must-revalidate, post-check=0, pre-check=0",
        "Pragma"        => "no-cache",
        "Expires"       => Time.now.rfc1123,
        "P3P"           => "CP='OTI NID CUR OUR STP ONL UNI PRE'",
      }
      HEAD       = View::HeadComposite
      FOOT       = View::FootComposite
      CONTENT    = nil
      CSS_CLASS  = "composite"
      COMPONENTS = {
        [0,0] => :head,
        [0,1] => :content,
        [0,2] => :foot,
      }
      META_TAGS = [
        {
          "name"    => "robots",
          "content" => "follow, index, noarchive",
        },
      ]
      def head(model, session)
        self::class::HEAD.new(model, session, self) unless self::class::HEAD.nil?
      end
      def content(model, session)
        self::class::CONTENT.new(model, session, self)
      end
      def foot(model, session)
        self::class::FOOT.new(model, session, self) unless self::class::FOOT.nil?
      end
    end
  end
end

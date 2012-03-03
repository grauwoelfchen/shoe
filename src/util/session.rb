#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/session'
require 'state/states'
require 'util/validator'
require 'fileutils'

module SHOE
  class Session < SBSM::Session
		DEFAULT_FLAVOR         = "gcc"
		DEFAULT_LANGUAGE       = "de"
		DEFAULT_STATE          = State::Greet::Hello
		DEFAULT_ZONE           = :greet
		EXPIRES                = 30 * 60
		SERVER_NAME            = 'shoe.localhost'
		PERSISTENT_COOKIE_NAME = 'shoe'
		QUERY_LIMIT            = 5
		QUERY_LIMIT_AGE        = 60 * 60 * 24
		@@requests ||= {}
    def process(request)
      @request_path = request.unparsed_uri
      @process_start = Time.now
      super
      '' ## return empty string across the drb-border
    end 
  end
end

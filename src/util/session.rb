#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/session'
require 'state/states'
require 'util/validator'
require 'custom/lookandfeelfactory'
require 'fileutils'

module SHOE
  class Session < SBSM::Session
		LF_FACTORY             = LookandfeelFactory
		DEFAULT_FLAVOR         = "gray"
		DEFAULT_LANGUAGE       = "de"
		DEFAULT_STATE          = State::Greet::Hello
		EXPIRES                = 30 * 60
		SERVER_NAME            = 'shoe.localhost'
		PERSISTENT_COOKIE_NAME = 'shoe'
		@@requests ||= {}
    def process(request)
      @request_path = request.unparsed_uri
      @process_start = Time.now
      super
      '' ## return empty string across the drb-border
    end 
  end
end

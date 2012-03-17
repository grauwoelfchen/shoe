#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/session'
require 'custom/lookandfeelfactory'
require 'state/states'

module SHOE
  class Session < SBSM::Session
		LF_FACTORY             = LookandfeelFactory
		DEFAULT_FLAVOR         = 'plain'
		DEFAULT_LANGUAGE       = 'de'
		DEFAULT_STATE          = State::Init
		EXPIRES                = 30 * 60
		SERVER_NAME            = 'shoe.localhost'
		PERSISTENT_COOKIE_NAME = 'shoe'
		def event
			super || :index
		end
  end
end

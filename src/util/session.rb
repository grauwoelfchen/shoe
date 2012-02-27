#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/session'
require 'state/states'
require 'fileutils'

module SHOE
  class Session < SBSM::Session
		DEFAULT_FLAVOR         = "gcc"
		DEFAULT_LANGUAGE       = "de"
		DEFAULT_STATE          = State::Home::Init
		DEFAULT_ZONE           = :drugs
		EXPIRES                = 30 * 60
		SERVER_NAME            = 'shoe.localhost'
		PERSISTENT_COOKIE_NAME = 'shoe'
		QUERY_LIMIT            = 5
		QUERY_LIMIT_AGE        = 60 * 60 * 24
		@@requests ||= {}
  end
end

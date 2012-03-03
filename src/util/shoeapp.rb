#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/drbserver'
require 'sbsm/index'
require 'util/shoeconfig'
require 'util/session'
require 'util/validator'
require 'custom/lookandfeelbase'
require 'fileutils'

module SHOE
  class App < SBSM::DRbServer
    CLEANING_INTERVAL = 5*60
    SESSION   = Session
    VALIDATOR = Validator
    def initialize opts={}
      start = Time.now
      puts "init system"
      puts "init system: #{Time.now - start}"
      puts "setup drb-delegation"
      # pending
      puts "system initialized"
      puts "initialized: #{Time.now - start}"
      super()
    end
  end
end

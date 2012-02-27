#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

puts 'loading testenvironment'

module SHOE
  DEVELOPER = 'yasaka@ywesee.com'
  class App < SBSM::DRbServer
    puts "disabling UPDATER"
    remove_const :RUN_UPDATER
    RUN_UPDATER = false
  end
  class Log
    MAIL_TO = [
      DEVELOPER,
    ]
  end
  remove_const :SERVER_NAME
  SERVER_NAME = 'shoe.localhost'
  SMTP_SERVER = 'localhost'
  module State
    # pending
  end
end


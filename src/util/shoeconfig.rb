#!/usr/bin/env ruby
# encoding: utf-8

$USING_STRSCAN = true

module SHOE
	SERVER_NAME  = 'shoe.localhost'
	SMTP_SERVER  = 'mail.ywesee.com'
	MAIL_FROM    = '"Yasuhiro Asaka" <yasaka@ywesee.com>'
	MAIL_TO      = ['yasaka@ywesee.com']
	SMTP_FROM    = 'yasaka@ywesee.com'
	SERVER_URI   = "druby://localhost:20000"
	PROJECT_ROOT = File.expand_path('../..', File.dirname(__FILE__))
	ENCODING     = 'UTF-8'
end

module SHOE
	class Cache
		MAIL_FROM = 'yasaka@ywesee.com'
		MAIL_RECIPIENTS = [
			"yasaka@ywesee.com",
		]
		SMTP_SERVER = ::SHOE::SMTP_SERVER
	end
end


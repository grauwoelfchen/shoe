#!/usr/bin/env ruby

require '/usr/local/lib/ruby/gems/1.9.1/gems/sbsm-1.1.4/lib/sbsm/request'
require 'util/shoeconfig'

DRb.start_service('druby://localhost:0')

begin
	SBSM::Request.new(SHOE::SERVER_URI).process
rescue Exception => e
	$stderr << "Shoe-Error: " << e.message << "\n"
	$stderr << e.class << "\n"
	$stderr << e.backtrace.join("\n") << "\n"
end

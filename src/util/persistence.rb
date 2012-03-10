#!/usr/bin/env ruby
# encoding: utf-8

require 'odba'

module SHOE
	module PersistenceMethods
		attr_reader :id
		def init(app)
		end
		def update_values(values, origin=nil)
			@revision = Time.now
			values.each { |key, value|
				key = key.to_s
				data_origins.store(key, origin)
				self.send(key + '=', value)
			}
		end
		private
		def set_id
			@id ||= self.odba_id
		end
	end
	module Persistence
		include PersistenceMethods
		include ODBA::Persistable
		ODBA_PREDEFINE_SERIALIZABLE = ['@data_origins']
		def initialize(*args)
			@revision = Time.now
			super
			set_id()
		end
	end
end

#!/usr/bin/env ruby
# encoding: utf-8

require 'dbi'
require 'pg'
require 'odba/connection_pool'

ODBA.storage.dbi = ODBA::ConnectionPool.new(
  'DBI:Pg:shoe', 'postgres', ''
)


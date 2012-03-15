#!/usr/bin/env ruby
# encoding: utf-8

require 'sbsm/drbserver'
require 'sbsm/index'
require 'odba'
require 'odba/index_definition'
require 'odba/drbwrapper'
require 'odba/18_19_loading_compatibility'
require 'util/shoeconfig'
require 'util/session'
require 'util/validator'
require 'models'
require 'custom/lookandfeelbase'
require 'fileutils'

module SHOE
  class ShoeSystem
    include ODBA::Persistable
    attr_reader :articles
    def initialize
      init
    end
    def init
      @articles ||= Hash.new
    end
    def article(slug)
      @slug[slug]
    end
    def recent_articles
      @recent_articles ||= @articles.values.sort_by{ |a| a.created_at }.reverse[0..2]
    end
    def create_article
      article = SHOE::Article.new
      @articles.store(article.id, article)
    end
    def delete_article(id)
      if(article = @articles.delete(id))
        @articles.odba_isolated_store
        article
      end
    end
  end
  class App < SBSM::DRbServer
    CLEANING_INTERVAL = 5*60
    MEMORY_LIMIT      = 20480
    SESSION   = Session
    VALIDATOR = Validator
    ENABLE_ADMIN = true
    def initialize opts={}
      @admin_threads = ThreadGroup.new
      start = Time.now
      puts "init system"
      @system = ODBA.cache.fetch_named('shoeapp', self) {
        ShoeSystem.new
      }
      @system.init
      @system.odba_store
      puts "init system: #{Time.now - start}"
      puts "setup drb-delegation"
      super(@system)
      puts "reset"
      reset
      puts "reset: #{Time.now - start}"
      log_size
      puts "system initialized"
      puts "initialized: #{Time.now - start}"
    end
    def reset
      @mutex.synchronize {
        @sessions.clear
      }
    end
    def log_size
      @size_logger = Thread.new {
        time = Time.now
        bytes    = 0
        threads  = 0
        sessions = 0
        format = "%s %s: sessions: %4i - threads: %4i  - memory: %4iMB %s"
        loop {
          begin
            lasttime = time
            time = Time.now
            alarm = time - lasttime > 60 ? '*' : ' '
            lastthreads = threads
            threads = Thread.list.size
            if threads > 150
              exit
            end
            lastbytes = bytes
            bytes = File.read("/proc/#{$$}/stat").split(' ').at(22).to_i
            mbytes = bytes / (2**20)
            if mbytes > MEMORY_LIMIT
              puts "Footprint exceeds #{MEMORY_LIMIT}MB. Exiting."
              Thread.main.raise SystemExit
            end
            lastsessions = sessions
            sessions = @sessions.size
            gc = ''
            gc << 'S' if sessions < lastsessions
            gc << 'T' if threads < lastthreads
            gc << 'M' if bytes < lastbytes
            path = File.expand_path('../../doc/resources/downloads/status',
                                    File.dirname(__FILE__))
            lines = File.readlines(path)[0,99] rescue []
            lines.unshift sprintf(format, alarm, 
                                  time.strftime('%Y-%m-%d %H:%M:%S'),
                                  sessions, threads, mbytes, gc)
            File.open(path, 'w') { |fh|
              fh.puts lines
            }
          rescue StandardError => e
            puts e.class
            puts e.message
            $stdout.flush
          end
        sleep 5
        }
      }
    end

  end
end

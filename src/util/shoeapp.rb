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
    ENABLE_ADMIN = true
    SESSION   = Session
    VALIDATOR = Validator
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
      reset()
      puts "reset: #{Time.now - start}"
      puts "system initialized"
      puts "initialized: #{Time.now - start}"
    end
    def reset
      @mutex.synchronize {
        @sessions.clear
      }
    end
  end
end

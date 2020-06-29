#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'
require_relative '../lib/game_server.rb'

servers = Scraper.get_servers

servers.each { |server| puts server.to_s }
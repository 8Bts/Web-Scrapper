#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'
require_relative '../lib/game_server.rb'

again = true

while again do
servers = Scraper.get_servers.sort_by! { |server| server.ping }
servers.each { |server| puts server.to_s }
print 'Type \'next\' if you want to load more: '
again = false unless gets.chomp.upcase == 'NEXT'
end
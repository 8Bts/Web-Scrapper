#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'

again = true

while again
  servers = Scraper.parse_servers.sort! { |a, b| b.ping <=> a.ping }
  servers.each { |server| puts server.to_s }
  print 'Type \'next\' if you want to load more: '
  again = false unless gets.chomp.upcase == 'NEXT'
end

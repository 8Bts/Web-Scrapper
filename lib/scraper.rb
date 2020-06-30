require 'nokogiri'
require 'httparty'
require 'net/ping'
require_relative '../lib/game_server'

class Scraper
  @@page_itr = 1

  def self.scrap_list(page)
    url = 'https://www.gametracker.com/search/cs/'
    url = "https://www.gametracker.com/search/cs/?searchpge=#{page}#search" if page > 1
    body = HTTParty.get(url).body
    doc = Nokogiri::HTML(body)
    doc
  end

  def self.parse_servers
    doc = scrap_list(@@page_itr)
    game_servers = []

    puts "\nTesting ping rates and parsing info...\n\n"
    doc.css('.table_lst.table_lst_srs tr').each do |tr|
      name = tr.css('a[href^="/server_info"]').text.strip
      ip = tr.css('span.ip').text
      port = tr.css('span.port').text.delete(':')
      server = Net::Ping::External.new(ip, port, 1) unless ip.empty?
      game_servers << GameServer.new(name, server.host, server.port, (server.duration * 1000).round) if server&.ping?
    end

    @@page_itr += 1
    game_servers
  end
end

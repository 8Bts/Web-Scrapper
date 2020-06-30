# spec/scraper_spec.rb

require_relative '../lib/scraper'

describe Scraper do
  describe 'Scraper.parse_servers' do

    it "returns array of GameServer objects which store server information scraped from website" do
      expect(Scraper.parse_servers.all? { |obj| obj.is_a?(GameServer) && obj.ip_port  }).to be_truthy
    end

  end
end

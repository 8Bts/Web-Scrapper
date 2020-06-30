# spec/game_server_spec.rb

require_relative '../lib/game_server'

describe GameServer do
  let(:server) { GameServer.new('Gamesites.cz ^Trouble in Town 2', '81.0.217.179', '27577', 55) }

  describe '#ip_port' do
    it 'returns ip + port in one string' do
      expect(server.ip_port).to eql('81.0.217.179:27577')
    end  
  end

  describe '#to_s' do
    expected = "#{'Gamesites.cz ^Trouble in Town 2'.light_white}\n
    IP:Port : 81.0.217.179:27577\n
    Ping    : #{'55'.yellow} ms\n
    \r" + ('=' * 50).light_black + "\n\n"

    it 'returns string containing all information about server' do
      expect(server.to_s).to eql expected
    end  
  end
end

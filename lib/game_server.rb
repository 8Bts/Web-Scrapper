class GameServer
  attr_reader :hostname, :ip, :port, :ping 
  def initialize(hostname, ip, port, ping)
    @hostname = hostname
    @ip = ip
    @port = port
    @ping = ping
  end

  def ip_port
    ip + ':' + port
  end

  def to_s
    hostname + ' ' + ip_port + ' ' + ping + 'ms'
  end
end

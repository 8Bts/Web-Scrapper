require 'colorize'

class GameServer
  attr_reader :hostname, :ip, :port, :ping
  def initialize(hostname, ip, port, ping)
    @hostname = hostname.light_white
    @ip = ip
    @port = port
    @ping = ping
    @ping_color = case ping
                  when 0..40
                    :green
                  when 41..100
                    :yellow
                  else
                    :red
                  end
  end

  def ip_port
    ip + ':' + port
  end

  def to_s
    "#{@hostname}\n
    IP:Port : #{ip_port}\n
    Ping    : #{@ping.to_s.colorize(@ping_color)} ms\n
    \r" + ('=' * 50).light_black + "\n\n"
  end
end

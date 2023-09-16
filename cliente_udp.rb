require "socket"

target_host = "127.0.0.1"
target_port = 4321

cmd = ARGV[0]
cmd_return = `#{cmd}`

client = UDPSocket.new
client.send(cmd_return, 0, target_host, target_port)

data, addr = client.recvfrom(4096)
puts data

client.close

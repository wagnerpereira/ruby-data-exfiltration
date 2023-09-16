require "socket"

IP = "0.0.0.0"
PORT = 4321
BUFFERSIZE = 4096

server = UDPSocket.new
server.bind(IP, PORT)

loop do
  bytes_address = server.recvfrom(BUFFERSIZE)
  message = bytes_address[0]
  address = bytes_address[1]

  client_msg = "Início da mensagem:\n#{message.force_encoding("ISO-8859-1")}"
  client_ip = "\nCliente: #{address[3]}:#{address[1]}"
  puts client_msg
  puts client_ip

  server.send("Dados recebidos!".encode("ISO-8859-1"), 0, address[3], address[1])
end

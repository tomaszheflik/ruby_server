# Simple http server in ruby
# Tomasz Heflik heflik@gmail.com
# All rights reserverd

require 'socket' 

if ARGV.empty?
  http_port = '4444'
else
  http_port = ARGV[0]
end
puts http_port

server = TCPServer.new(http_port)

loop do
  socket = server.accept
  request = socket.gets
  STDERR.puts request

  response = "Hello from the Docker side on port #{http_port}!\n"

  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  socket.print "\r\n"
  socket.print response

  socket.close
end
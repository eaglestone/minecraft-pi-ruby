require 'socket'

class Connection
  def initialize (server = 'localhost', port = 4711)
    begin
      @socket = TCPSocket.new server, port
    rescue
      puts "Error connecting to Minecraft. Is it running?\n\n"
      @socket.close if @socket
      abort("#{$!}")
    end
  end
  
  def send_command(command)
    if @socket
      @socket.puts command
    else
      puts "Not connected to Minecraft Pi! Is it running?"
    end
  end
  
  def gets
    result = @socket.gets if @socket
    return result
  end
  
  def Connection.finalize(id)
    @socket.close if @socket
  end
end

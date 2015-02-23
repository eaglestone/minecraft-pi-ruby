require 'socket'

class Connection
  def initialize (server = 'localhost', port = 4711)
    begin
      @socket = TCPSocket.new server, port
    rescue
      puts "Error connecting to Minecraft.\nIs Minecraft running? If so, is it in a live game?\n\n"
      @socket.close if @socket
      abort("#{$!}")
    end
  end
  
  def send_command(command)
    if @socket
      @socket.puts command
    else
      puts "Not connected to Minecraft Pi!\n Is it running and are you in a live game?"
    end
  end
  
  def send_with_response(command)
    send_command command
    retVal = @socket.gets.chomp
    return retVal
  end
  
  
  def Connection.finalize(id)
    @socket.close if @socket
  end
end

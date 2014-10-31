require_relative 'connection'
require_relative 'position'
require_relative 'blocks'

class Minecraft
  include Block
  
  def initialize(connection = nil)
    @connection = connection
    @connection ||= Connection.new
  end

  class << self
    def control(&script)
      mc = self.new
      mc.instance_eval(&script)
    end
    
    alias_method :world, :control
    alias_method :player, :control
  end
  
  def say(message)
    @connection.send_command "chat.post(#{message})"
  end
  
  def set_camera_mode(mode)
    @connection.send_command 'camera.mode.setNormal' if mode == :normal
    @connection.send_command 'camera.mode.setFixed' if mode == :fixed
    @connection.send_command 'camera.mode.setFollow' if mode == :follow
  end
  
  def set_block(*args)
    command = "world.setBlocks(" + make_command_from_args(args)
    @connection.send_command command
  end
  
  def set_blocks(*args)
    command = "world.setBlocks(" + make_command_from_args(args)
    @connection.send_command command
  end
  alias_method :make_cuboid, :set_blocks
  
  def get_ground_height(x,z)
    return  @connection.send_with_response "world.getHeight(#{x},#{z})"
  end
  alias_method :ground_height, :get_ground_height
  
  def set_player_position(*args)
    command = "player.setPos("
    case args.length
    when 1
      command += "#{args[0].x},#{args[0].y},#{args[0].z})"
    when 3
      command += "#{args[0]},#{args[1]},#{args[2]})"
    else
      return
    end
    @connection.send_command command
  end
  alias_method :set_position, :set_player_position
  
  def get_player_position
    puts @connection.send_with_response('player.getPos()')
  end
  alias_method :get_position, :get_player_position
  
  private
  def make_command_from_args(args)
    string = ""
    args.length.times do |i|
      string += "#{args[i]},"
    end
    return string[0..-2]
  end
end
    

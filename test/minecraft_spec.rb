require 'minitest/autorun'
require_relative '../lib/minecraft-pi-ruby'
require_relative '../lib/position'

describe Minecraft do

  before do
    @conn = MiniTest::Mock.new
    @mc = Minecraft.new(@conn)
  end
  
  it "can be created" do
    Minecraft.new.must_be_instance_of Minecraft
  end
  
  it "can have control called on an instant of the class" do
    Minecraft.must_respond_to 'control'
  end
  
  it "responds to world being called on an instance" do
    Minecraft.must_respond_to 'world'
  end
  
  it "should call the cameraFollow API with the right protocol" do
    @conn.expect :send_command, :return_value, ['camera.mode.setNormal']
    @mc.set_camera_mode :normal
        
    assert @conn.verify
  end
  
  it "should send the setBock(x,y,z,id) message" do
    @conn.expect :send_command, :return_value, ['world.setBlock(1,2,3,4)']
    @mc.set_block(1,2,3,4)
    
    assert @conn.verify
  end
  
  it "should send the setBlock(x,y,z,id) message when called with a Position" do
    @conn.expect :send_command, :return_value, ['world.setBlock(1,2,3,4)']
    @mc.set_block(Position.new(1,2,3),4)
    @conn.verify
  end
  
  it "should handle the setBlocks with two positions given" do
    @conn.expect :send_command, :return_value, ['world.setBlocks(0,0,0,10,10,10,1)']
    @mc.set_blocks(Position.new(0,0,0),Position.new(10,10,10),1)
    assert @conn.verify
  end
  
  it "should handle setBlocks with individual coords" do
    @conn.expect :send_command, :return_value, ['world.setBlocks(0,0,0,3,3,3,2)']
    @mc.set_blocks(0,0,0,3,3,3,2)
    assert @conn.verify
  end
  
  it "gets the ground level" do
    @conn.expect :send_with_response, 10, ['world.getHeight(4,5)']
    height = @mc.get_ground_height(4,5)
    assert @conn.verify
    height.must_be_kind_of(Numeric)
  end
  
end

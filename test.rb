require_relative "lib/minecraft-pi-ruby"

Minecraft.world do
  say "Hello from Ruby!"
    
  position1 = Position.new(0,10,0)
  position2 = Position.new(10,20,10)
  make_cuboid(position1, position2, Block::DIAMOND_BLOCK)
  sleep 2
  make_cuboid(position1, position2, Block::AIR)
  
  10.times do |counter|
    set_block(counter, 20, 0, Block::STONE)
    set_block(counter, 20, 9, Block::STONE)
    set_block(0, 20, counter, Block::STONE)
    set_block(9, 20, counter, Block::STONE)
  end
  
  say "Bye from Ruby!"  
  get_position
  set_position(30,30,30)
  sleep 3
  get_position
  
end


mc = Minecraft.new
mc.say 'Hello to Steve!'
mc.set_player_position(16,16,16)
sleep 2
mc.set_position(0,15,0)
mc.get_position
sleep 2
mc.set_player_position(Position.new(28,18,28))
mc.make_cuboid(16,18,16,20,20,20,Block::TNT,1)
mc.say 'Now go and click on the TNT!'

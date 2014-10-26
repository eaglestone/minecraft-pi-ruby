require_relative "lib/minecraft-pi-ruby"

Minecraft.world do
  say "Hello from Ruby!"
  20.times {|x| set_block(x,20,x,1)}
  sleep 2
  20.times {|x| set_block(x,20,x,0)}
  
  
  position1 = Position.new(0,10,0)
  position2 = Position.new(10,20,10)
  make_cuboid(position1, position2, BlockCode::DIAMOND_BLOCK)
  
  say "Bye from Ruby!"  
end

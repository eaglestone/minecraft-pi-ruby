require_relative "lib/minecraft-pi-ruby"

Minecraft.world do
  say "Hello from Ruby!"
  sleep 1
  say "Bye from Ruby!"  
  20.times {|x| set_block(x,20,x,1)}
  sleep 2
  20.times {|x| set_block(x,20,x,0)}
  set_blocks(-10,10,-10,20,20,20,57)
  sleep 2
  set_blocks(-10,10,-10,20,20,20,0)
  
  set_blocks(Position.new(2,2,2), Position.new(10,20,10),1)
  sleep 2
  set_blocks(Position.new(2,2,2), Position.new(10,20,10),0)
end

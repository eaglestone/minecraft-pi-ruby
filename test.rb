require_relative "lib/minecraft-pi-ruby"

mc = Minecraft.new
mc.say 'setting position'
mc.set_position(0,15,0)
sleep 5
mc.say 'moving'
pos = mc.get_position

10.times do
  pos =  pos + Position.new(0,0,1) if pos
  mc.set_position(pos) if pos
  pos = mc.get_position
  sleep 0.5
end

mc.set_player_position(Position.new(29,18,28))
mc.make_cuboid(16,18,16,20,20,20,Block::TNT,1)
mc.say 'Now go and click on the TNT!'

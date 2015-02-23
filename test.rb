require_relative "lib/minecraft-pi-ruby"

mc = Minecraft.new
mc.say 'setting position'
mc.set_position(0,15,0)
sleep 5

mc.build_wall(:length => 20)

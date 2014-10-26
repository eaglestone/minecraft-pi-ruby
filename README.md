#Minecraft-Pi Ruby

##Please note
This project is still in the early stages of development. It is not ready for use
with students and has not yet been pushed to RubyGems.

##Overview

This is a Ruby gem to allow access to the Minecraft Pi Edition API from Ruby.
The aim is that the syntax is clear for fledgling coders to read and
understand as they work towards creating their own scripts.

All the fun of Minecraft Pi Edition and all the goodness of Ruby! With Sonic Pi, 
KidsRuby and Minecraft, there really is no reason not to show you students the 
joy of Ruby programming!

##Introduction
The Pi Edition of Minecraft needs to be running for the gem to make a connection. Then you can use Ruby 
code such as:
```
Minecraft.world do
  say "Hello from Ruby!"
  20.times {|x| set_block(x,20,x,1)}
  sleep 2
  20.times {|x| set_block(x,20,x,0)}
  
  position1 = Position.new(0,10,0)
  position2 = Position.new(10,20,10)
  make_cuboid(position1, position2, 1)
  
  say "Bye from Ruby!"  
end
```

You can also instantiate a Minecraft object in addition to writing script inside Ruby blocks.
For example:
```
mc = Minecraft.new
mc.say "Hello to Steve!"
```

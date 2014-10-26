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
end
```

You can also instantiate a Minecraft object instead of writing script inside Ruby blocks.
For example:
```
mc = Minecraft.new
mc.say 'Hello to Steve!'
mc.make_cuboid(16,18,16,20,20,20,Block::TNT,1)
mc.say 'Now go and click on the TNT!'
```
##Installation

TODO

##Usage

So far, only the following commands have been implemented

- say "message" to display a message on the screen
- set_camera_mode to either :fixed, :normal or :follow 
- set_block takes 3 values for the x, y and z location, or a Position (Position.new(x,y,z))
- set_blocks is the same as make_cuboid. It takes 2 Positions and an ID for the block (see below), or 
two sets of x,y,z coordinates followed by the block ID
- get_ground_height(x,z) or just ground_height(x,z) return the height of the ground at the (x,z) location
- set_player_position(x,y,z) or set_player_position(Position) moves the player to that position

###Block IDs

Blocks can be set using and ID in the form Block::NAME. For example Block::TNT.

The blocks are:
  AIR                 numerical value is 0
  STONE               numerical value is 1
  GRASS               numerical value is 2
  DIRT                numerical value is 3
  COBBLESTONE         numerical value is 4
  WOOD_PLANKS         numerical value is 5
  SAPLING             numerical value is 6
  BEDROCK             numerical value is 7
  WATER_FLOWING       numerical value is 8
  WATER               numerical value is WATER_FLOWING
  WATER_STATIONARY    numerical value is 9
  LAVA_FLOWING        numerical value is 10
  LAVA                numerical value is LAVA_FLOWING
  LAVA_STATIONARY     numerical value is 11
  SAND                numerical value is 12
  GRAVEL              numerical value is 13
  GOLD_ORE            numerical value is 14
  IRON_ORE            numerical value is 15
  COAL_ORE            numerical value is 16
  WOOD                numerical value is 17
  LEAVES              numerical value is 18
  GLASS               numerical value is 20
  LAPIS_LAZULI_ORE    numerical value is 21
  LAPIS_LAZULI_BLOCK  numerical value is 22
  SANDSTONE           numerical value is 24
  BED                 numerical value is 26
  COBWEB              numerical value is 30
  GRASS_TALL          numerical value is 31
  WOOL                numerical value is 35
  FLOWER_YELLOW       numerical value is 37
  FLOWER_CYAN         numerical value is 38
  MUSHROOM_BROWN      numerical value is 39
  MUSHROOM_RED        numerical value is 40
  GOLD_BLOCK          numerical value is 41
  IRON_BLOCK          numerical value is 42
  STONE_SLAB_DOUBLE   numerical value is 43
  STONE_SLAB          numerical value is 44
  BRICK_BLOCK         numerical value is 45
  TNT                 numerical value is 46
  BOOKSHELF           numerical value is 47
  MOSS_STONE          numerical value is 48
  OBSIDIAN            numerical value is 49
  TORCH               numerical value is 50
  FIRE                numerical value is 51
  STAIRS_WOOD         numerical value is 53
  CHEST               numerical value is 54
  DIAMOND_ORE         numerical value is 56
  DIAMOND_BLOCK       numerical value is 57
  CRAFTING_TABLE      numerical value is 58
  FARMLAND            numerical value is 60
  FURNACE_INACTIVE    numerical value is 61
  FURNACE_ACTIVE      numerical value is 62
  DOOR_WOOD           numerical value is 64
  LADDER              numerical value is 65
  STAIRS_COBBLESTONE  numerical value is 67
  DOOR_IRON           numerical value is 71
  REDSTONE_ORE        numerical value is 73
  SNOW                numerical value is 78
  ICE                 numerical value is 79
  SNOW_BLOCK          numerical value is 80
  CACTUS              numerical value is 81
  CLAY                numerical value is 82
  SUGAR_CANE          numerical value is 83
  FENCE               numerical value is 85
  GLOWSTONE_BLOCK     numerical value is 89
  BEDROCK_INVISIBLE   numerical value is 95
  STONE_BRICK         numerical value is 98
  GLASS_PANE          numerical value is 102
  MELON               numerical value is 103
  FENCE_GATE          numerical value is 107
  GLOWING_OBSIDIAN    numerical value is 246
  NETHER_REACTOR_CORE numerical value is 247

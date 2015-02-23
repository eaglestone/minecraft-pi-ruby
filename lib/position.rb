class Position

  attr_accessor :x, :y, :z
  
  def initialize (x,y = nil,z = nil)
    @x=x if x.is_a? Integer
    @y=y if y
    @z=z if z
    
    if x.is_a? String
		values = x.split(',')
		@x = values[0].to_i
		@y = values[1].to_i
		@z = values[2].to_i
    end
  end

  def to_s
    "#{@x},#{@y},#{@z}"
  end
  
  
  def eql?(position)
    self.class.equal?(position.class) &&
      @x == position.x &&
      @y == position.y &&
      @z == position.z
  end
  alias == eql?
  
  def +(position)
    @x += position.x
    @y += position.y
    @z += position.z
    self
  end
  
  def -(position)
    @x -= position.x
    @y -= position.y
    @z -= position.z
    self
  end

  def *(scale)
    if scale.is_a?(Numeric)
      @x *= scale
      @y *= scale
      @z *= scale
    elsif scale.is_a?(Position)
      @x *= scale.x
      @y *= scale.y
      @z *= scale.z
    end
    
    self
  end

end

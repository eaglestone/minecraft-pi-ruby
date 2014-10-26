class Position

  attr_accessor :x, :y, :z
  
  def initialize (x,y,z)
    @x=x
    @y=y
    @z=z
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
    @x+=position.x
    @y+=position.y
    @z+=position.z
    self
  end
  
  def -(position)
    @x-=position.x
    @y-=position.y
    @z-=position.z
    self
  end

  def *(scale)
    if scale.is_a?(Numeric)
      @x*=scale
      @y*=scale
      @z*=scale
    elsif scale.is_a?(Position)
      @x*=scale.x
      @y*=scale.y
      @z*=scale.z
    end
    
    self
  end

end

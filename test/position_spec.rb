require 'minitest/autorun'
require_relative '../lib/position'

describe Position do
  before do
    @pos = Position.new(1,2,3)
  end
  it "initialises with 3 integers for x, y and z" do
    @pos.x.must_equal 1
    @pos.y.must_equal 2
    @pos.z.must_equal 3
  end    
  
  it "returns to_s in a format for sending to server" do
    @pos.to_s.must_equal "1,2,3"
  end
  
  it "is equal to another Position if the coords are the same" do
    Position.new(1,2,3).must_equal @pos
  end
  
  it "adds the dimensions with another position object" do
    (@pos + @pos).must_equal Position.new(2,4,6)
  end
  
  it "subtracts the dimensions with another position object" do
    (@pos - @pos).must_equal Position.new(0,0,0)
  end
  
  it "does scalar multiplication" do
    (@pos*4).must_equal Position.new(4,8,12)
  end

end

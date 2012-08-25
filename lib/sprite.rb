class Sprite
  START_FALL_RATE = 0.1
  MAX_FALL_RATE = 0.8
  attr_accessor :x, :y, :graphics, :state, :teleporting, :fallspeed

  attr_reader :alive

  def initialize(attributes)
    attributes.each do |k, v|
      send("#{k}=".to_sym, v)
    end
    self.fallspeed = START_FALL_RATE
    self.state = :standing
    self.teleporting = false
    @alive = true
  end

  def kill
    @alive = false
  end


  def draw
    current_graphic.draw x, y
  end

  def intersects(x, y, right_x, bottom_y)
    x <= self.right_x && right_x >= self.x && y <= self.bottom_y && bottom_y >= self.y
  end

  def right_x
    self.x + current_graphic.getWidth
  end

  def current_graphic
    self.graphics[self.state]
  end

  def bottom_y
    self.y + current_graphic.getHeight
  end

  def fall(delta)
    if !self.teleporting
      if self.fallspeed < MAX_FALL_RATE
        @fallspeed *= 1 + MAX_FALL_RATE / 10.0
      else
        self.fallspeed = MAX_FALL_RATE
      end
      @y += @fallspeed * delta
    else
      self.fallspeed = START_FALL_RATE
    end
  end
end
class Sprite
  START_FALL_RATE = 0.1
  MAX_FALL_RATE = 0.8
  attr_accessor :x, :y, :graphics, :state, :teleporting, :fallspeed

  def initialize(attributes)
    attributes.each do |k, v|
      send("#{k}=".to_sym, v)
    end
    self.fallspeed = START_FALL_RATE
    self.state = :standing
    self.teleporting = false
  end


  def draw
    self.graphics[self.state].draw x, y
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
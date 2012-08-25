class Sprite
  attr_accessor :x, :y, :graphics
  def initialize(attributes)
    attributes.each do |k, v|
      send("#{k}=".to_sym, v)
    end
  end
end
class Sprite
  attr_accessor :x, :y, :height, :width
  def initialize(attributes)
    attributes.each do |k, v|
      send("#{k}=".to_sym, v)
    end
  end
end